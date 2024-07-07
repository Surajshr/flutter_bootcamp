import 'package:flutter/material.dart';
import 'package:routing_example/pages/page1.dart';
import 'package:routing_example/pages/page2.dart';
import 'package:routing_example/pages/page3.dart';
import 'package:routing_example/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.initial,
      routes: {
        AppRoute.initial: (context) => const Page1(),
        AppRoute.secondPage: (context) => const Page2(),
        AppRoute.thirdPage: (context) => const Page3(),
      },
    );
  }
}
