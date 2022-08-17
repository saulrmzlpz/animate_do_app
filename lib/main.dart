import 'package:animate_do_app/screens/navigate_screen.dart';
import 'package:animate_do_app/screens/twitter_screen.dart';
import 'package:flutter/material.dart';

import 'package:animate_do_app/screens/first_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate Do App',
      home: FirstScreen(),
    );
  }
}
