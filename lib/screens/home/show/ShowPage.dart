import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:hnews/api/v0/shows.dart';
import 'package:hnews/api/v0/generic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  Future<void> updateShow() async {
    var newShows = await getShows(limit: 200);
    List<ApiItem> stories_loaded = [];
    for (var i = 0; i < newShows.length; i++) {
      stories_loaded.add(await getItemFromId(newShows[i]));

      if (!mounted) {
        continue;
      }

      setState(() {
        shows = stories_loaded;
      });
    }
  }

  static List<ApiItem> shows = [];

  Future<void> openBrowser(int position) async {
    var currentUrl = shows[position].url;
    if (await canLaunch(currentUrl)) {
      await launch(currentUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (shows.length == 0) {
      updateShow();
    }

    return Container(
        child: RefreshIndicator(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: shows.length,
        itemBuilder: (context, position) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              title: Text(shows[position].title),
              subtitle: Text(
                  "${shows[position].url} - ${shows[position].descendants} comments"),
              onTap: () {
                openBrowser(position);
                // Navigator.of(context)
                //     .pushNamed("/home/show", arguments: shows[position]);
              },
            ),
            actions: [
              // IconSlideAction(
              //   caption: 'Upvote',
              //   color: Colors.orange,
              //   icon: Icons.arrow_upward,
              //   onTap: () => upvote(position),
              // ),
              // IconSlideAction(
              //   caption: 'Favorite',
              //   color: Colors.yellow,
              //   icon: Icons.star,
              //   onTap: () => favorite(position),
              // ),
            ],
            secondaryActions: [
              // IconSlideAction(
              //   caption: 'Unvote',
              //   color: Colors.blue,
              //   icon: Icons.arrow_downward,
              //   onTap: () => unvote(position),
              // ),
              // IconSlideAction(
              //   caption: 'Share',
              //   color: Colors.blue,
              //   icon: Icons.share,
              //   onTap: () => share(position),
              // ),
            ],
          );
        },
      ),
      onRefresh: updateShow,
    ));
  }
}
