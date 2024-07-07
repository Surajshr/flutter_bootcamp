import 'package:flutter/material.dart';
import 'package:routing_example/route/app_route.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.secondPage);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Page2(),
                //   ),
                // );
              },
              child: const Text('GoToPage2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoute.thirdPage,
                );

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Page3(),
                //   ),
                // );
              },
              child: const Text('GoToPage3'),
            )
          ],
        ),
      ),
    );
  }
}
