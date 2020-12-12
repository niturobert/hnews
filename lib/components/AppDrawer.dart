import 'package:flutter/material.dart';

class AppDrawer extends Drawer {
  int currentIndex = 0;

  AppDrawer({@required this.currentIndex}) : super();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Image.asset("assets/img/hnlogo.jpg"),
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
        ),
        ListTile(
          title: Text("Home"),
          tileColor: (currentIndex == 0) ? Colors.deepOrangeAccent : null,
          onTap: () {
            if (currentIndex != 0) Navigator.of(context).pushNamed("/home");
          },
        ),
        // ListTile(
        //   title: Text("Settings"),
        //   tileColor: (currentIndex == 1) ? Colors.deepOrangeAccent : null,
        //   onTap: () {
        //     if (currentIndex != 1) Navigator.of(context).pushNamed("/settings");
        //   },
        // ),
        // ListTile(
        //   title: Text("My Account"),
        //   tileColor: (currentIndex == 2) ? Colors.deepOrangeAccent : null,
        //   onTap: () {
        //     if (currentIndex != 2) Navigator.of(context).pushNamed("/account");
        //   },
        // ),
        ListTile(
          title: Text("About"),
          tileColor: (currentIndex == 1) ? Colors.deepOrangeAccent : null,
          onTap: () {
            if (currentIndex != 1) Navigator.of(context).pushNamed("/about");
          },
        )
      ],
    ));
  }
}
