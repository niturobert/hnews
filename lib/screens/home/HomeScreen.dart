import 'package:flutter/material.dart';
import 'dart:io';

import 'package:hnews/components/AppDrawer.dart';

import 'package:hnews/screens/home/favorites/FavoritesPage.dart';
import 'package:hnews/screens/home/stories/StoriesPage.dart';
import 'package:hnews/screens/home/jobs/JobsPage.dart';
import 'package:hnews/screens/home/show/ShowPage.dart';
import 'package:hnews/screens/home/ask/AskPage.dart';

enum SortingType { Best, Top, New }

class HomeScreen extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var sort_type = "best";

  int currentIndex = 0;

  void changeSortType(String newValue) {
    if (newValue == this.sort_type) {
      return;
    }

    setState(() {
      sort_type = newValue;

      this.children[0] = StoriesPage(sort_type: newValue);
    });
  }

  var children = [
    StoriesPage(sort_type: "best"),
    ShowPage(),
    AskPage(),
    JobsPage(),
    FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Permission.
    try {
      InternetAddress.lookup('google.com').then((result) {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          print('connected');
        }
      });
    } on SocketException catch (_) {
      print('not connected');
    }

    return Scaffold(
      appBar: new AppBar(
        title: Text("HackerNews"),
        backgroundColor: Colors.deepOrange,
        actions: (true)
            ? null
            : [
                PopupMenuButton<String>(
                  onSelected: changeSortType,
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: "best",
                      child: Text('Sort by Best',
                          style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem<String>(
                      value: "new",
                      child: Text('Sort by New',
                          style: TextStyle(color: Colors.black)),
                    ),
                    const PopupMenuItem<String>(
                      value: "top",
                      child: Text('Sort by Top',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
      ),
      body: children[currentIndex],
      drawer: AppDrawer(currentIndex: 0),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Stories"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Show"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: "Ask HN"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          // BottomNavigationBarItem(
          // icon: Icon(Icons.bookmark), label: "Favorites"),
        ],

        // backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,

        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
      ),
    );
  }
}
