import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:hnews/api/v0/generic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:hnews/components/SitePreview.dart';

class StoryItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  Future<void> updatePage() async {
    print("Update stories...");
  }

  @override
  Widget build(BuildContext context) {
    ApiItem currentStory = ModalRoute.of(context).settings.arguments;
    List<ApiItem> currentStoryComments = getCommentsFromId(currentStory.id);

    return Scaffold(
      appBar: AppBar(title: Text(currentStory.title)),
      body: Container(
        child: RefreshIndicator(
          child: ListView.separated(
            separatorBuilder: (context, index) { return Divider(); },
            itemCount: currentStoryComments.length,
            itemBuilder: (context, index) {
              return Slidable(
                child: ListTile(
                  title: Text(currentStoryComments[index].title),
                ),

                actionPane: SlidableDrawerActionPane(),
                actions: [
                  IconSlideAction(
                    icon: Icons.arrow_upward,
                    color: Colors.orange,
                  ),
                  IconSlideAction(
                    icon: Icons.reply,
                    color: Colors.yellow,
                  ),
                ],
              );
              // return ListTile(
                // title: Text(currentStoryComments[index].title),
              // );
            },
          ),

          onRefresh: updatePage,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat_bubble),
        backgroundColor: Colors.deepOrange,
        onPressed: () {},
      ),
    );
  }
}