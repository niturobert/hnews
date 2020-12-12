import 'package:flutter/material.dart';
import 'package:hnews/components/AppDrawer.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("About"),
        ),
        drawer: AppDrawer(
          currentIndex: 1,
        ),
        body: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Text(
                "Version: 1.0.0\nVersion Name: Mercury\nSubmit bugs and feature requests at heyitsrobert@protonmail.com\n")));
  }
}
