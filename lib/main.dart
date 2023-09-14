import 'package:flutter/material.dart';
import 'package:second_task/edit_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const HomeScreen(),
          '/edit': (context) => const Editscreen()
        }

        //home: HomeScreen(),
        );
  }
}

