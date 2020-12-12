import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:hnews/api/v0/stories.dart';
import 'package:hnews/api/v0/generic.dart';

class JobsItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobsItemState();
}

class _JobsItemState extends State<JobsItem> {
  Future<void> updateStories() async {
    print("Update stories...");

    var new_stories = await getStories(sorting: "best", limit: 200);
    List<ApiItem> stories_loaded = [];
    for (var i = 0; i < new_stories.length; i++) {
      stories_loaded.add(await getItemFromId(new_stories[i]));

      setState(() {
        stories = stories_loaded;
      });
    }
  }

  List<ApiItem> stories = [];

  @override
  Widget build(BuildContext context) {
    ApiItem currentJob = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(currentJob.title)),
    );
    return Scaffold();
  }
}
