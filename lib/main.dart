import 'package:flutter/material.dart';

import 'package:animate_do_app/screens/first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate Do App',
      home: FirstScreen(),
    );
  }
}
