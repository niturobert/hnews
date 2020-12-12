import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<void> updateFavorites() async {
    print("Update Favorites...");
  }

  static var Favorites = [];

  void open_browser(int position) {
    print("Visit website");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RefreshIndicator(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: Favorites.length,
        itemBuilder: (context, position) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              title: Text(Favorites[position].title),
              subtitle: Text(Favorites[position].url),
              onTap: () {
                Navigator.of(context).pushNamed("/home/Favorites",
                    arguments: {"job": Favorites[position]});
              },
            ),
            actions: [
              IconSlideAction(
                caption: 'Go to website',
                color: Colors.purple,
                icon: Icons.remove_red_eye,
                onTap: () => open_browser(position),
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                caption: 'Go to website',
                color: Colors.purple,
                icon: Icons.remove_red_eye,
                onTap: () => open_browser(position),
              ),
            ],
          );
        },
      ),
      onRefresh: updateFavorites,
    ));
  }
}
