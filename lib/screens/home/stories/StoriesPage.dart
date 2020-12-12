import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hnews/api/v0/generic.dart';
import 'package:hnews/api/v0/stories.dart';
import 'package:url_launcher/url_launcher.dart';

class StoriesPage extends StatefulWidget {
  String sort_type = "";
  StoriesPage({@required this.sort_type}) : super();

  @override
  State<StatefulWidget> createState() =>
      _StoriesPageState(sort_type: sort_type);
}

class _StoriesPageState extends State<StoriesPage> {
  String sort_type = "";
  _StoriesPageState({@required this.sort_type}) : super();

  Future<void> updateStories() async {
    var newStories = await getStories(sorting: this.sort_type, limit: 200);
    List<ApiItem> stories_loaded = [];
    for (var i = 0; i < newStories.length; i++) {
      stories_loaded.add(await getItemFromId(newStories[i]));

      if (!mounted) {
        continue;
      }

      setState(() {
        stories = stories_loaded;
      });
    }
  }

  static List<ApiItem> stories = [];

  Future<void> openBrowser(int position) async {
    var currentUrl = stories[position].url;
    if (await canLaunch(currentUrl)) {
      await launch(currentUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (stories.length == 0) {
      updateStories();
    }

    return Container(
        child: RefreshIndicator(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: stories.length,
        itemBuilder: (context, position) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              title: Text(stories[position].title),
              subtitle: Text(
                  "${stories[position].url}\n${stories[position].descendants} comments"),
              onTap: () {
                // Navigator.of(context).pushNamed("/home/story", arguments: stories[position]);
                openBrowser(position);
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
              //   caption: 'Share',
              //   color: Colors.blue,
              //   icon: Icons.share,
              //   onTap: () => share(position),
              // ),
              // IconSlideAction(
              //   caption: 'Go to website',
              //   color: Colors.purple,
              //   icon: Icons.remove_red_eye,
              //   onTap: () => openBrowser(position),
              // ),
            ],
          );
        },
      ),
      onRefresh: updateStories,
    ));
  }
}
