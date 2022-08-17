import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/screens/navigate_screen.dart';
import 'package:animate_do_app/screens/twitter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(duration: Duration(milliseconds: 500), child: Text('Animate Do')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => TwitterScreen()));
              },
              icon: FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: 100,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => FirstScreen()));
                },
                icon: Icon(Icons.navigate_next)),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(delay: Duration(milliseconds: 200), child: Text('Título', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))),
            FadeInDown(
                delay: Duration(milliseconds: 1000),
                child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
            Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => NavigateScreen())),
          child: FaIcon(FontAwesomeIcons.play),
        ),
      ),
    );
  }
}
