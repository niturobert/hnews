import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hnews/api/v0/asks.dart';
import 'package:hnews/api/v0/generic.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:url_launcher/url_launcher.dart';

class AskPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  Future<void> updateAsk() async {
    var newAsks = await getAsks(limit: 200);
    List<ApiItem> storiesLoaded = [];
    for (var i = 0; i < newAsks.length; i++) {
      storiesLoaded.add(await getItemFromId(newAsks[i]));

      if (!mounted) {
        continue;
      }

      setState(() {
        asks = storiesLoaded;
      });
    }
  }

  static List<ApiItem> asks = [];

  Future<void> openBrowser(int position) async {
    var currentUrl = asks[position].url;
    if (await canLaunch(currentUrl)) {
      await launch(currentUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (asks.length == 0) {
      updateAsk();
    }

    return Container(
        child: RefreshIndicator(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: asks.length,
        itemBuilder: (context, position) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              title: Text(asks[position].title),
              subtitle: Text("${asks[position].descendants} comments"),
              onTap: () {
                openBrowser(position);
                // Navigator.of(context)
                //     .pushNamed("/home/story", arguments: asks[position]);
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
      onRefresh: updateAsk,
    ));
  }
}
