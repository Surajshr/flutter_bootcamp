import 'package:flutter/material.dart';
import 'package:routing_example/route/app_route.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (isPoped) {
        showDialog(
            context: context,
            builder: (secondContext) {
              return AlertDialog(
                title: const Text('Are you sure you want to go back ?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(secondContext);
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoute.initial,
                      );
                    },
                    child: const Text('Yes'),
                  )
                ],
              );
            });
        print('You click system Back button');
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        body: Center(
          child: Text(
            'You are in Second Page',
          ),
        ),
      ),
    );
  }
}
