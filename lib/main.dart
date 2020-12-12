import 'package:flutter/material.dart';
import './screens/home/HomeScreen.dart';
import './screens/about/AboutScreen.dart';

import './screens/home/stories/StoryItem.dart';
import './screens/home/jobs/JobsItem.dart';
import './screens/home/show/ShowItem.dart';
import './screens/home/ask/AskItem.dart';

void main() => runApp(HackerNewsApplication());

class HackerNewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        initialRoute: "/home",
        color: Colors.deepOrange,
        routes: {
          "/home": (context) => HomeScreen(),
          "/home/story": (context) => StoryItem(),
          "/home/ask": (context) => AskItem(),
          "/home/show": (context) => ShowItem(),
          "/home/jobs": (context) => JobsItem(),
          "/home/favorites": (context) => throw Exception("Not implemented"),
          "/post": (context) => throw Exception("Not implemented"),
          "/settings": (context) => throw Exception("Not implemented"),
          "/account": (context) => throw Exception("Not implemented"),
          "/about": (context) => AboutScreen(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepOrange,
            secondaryHeaderColor: Colors.yellowAccent,
            canvasColor: Color.fromRGBO(32, 32, 32, 1.0),
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                )));
  }
}
