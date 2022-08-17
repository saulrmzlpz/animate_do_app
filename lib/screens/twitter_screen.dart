import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  bool activateAnim = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1DA1F2),
      body: Center(
        child: ZoomOut(
          animate: activateAnim,
          duration: Duration(seconds: 1),
          from: 40,
          child: FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            activateAnim = true;
          });
        },
        backgroundColor: Colors.white,
        child: FaIcon(
          FontAwesomeIcons.play,
          color: Color(0xFF1DA1F2),
        ),
      ),
    );
  }
}
