import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hnews/api/v0/jobs.dart';
import 'package:hnews/api/v0/generic.dart';
import 'package:url_launcher/url_launcher.dart';

class JobsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  Future<void> updateJobs() async {
    var newJobs = await getJobs(limit: 200);
    List<ApiItem> storiesLoaded = [];
    for (var i = 0; i < newJobs.length; i++) {
      storiesLoaded.add(await getItemFromId(newJobs[i]));

      if (!mounted) {
        continue;
      }

      setState(() {
        jobs = storiesLoaded;
      });
    }
  }

  static List<ApiItem> jobs = [];

  Future<void> openBrowser(int position) async {
    var currentUrl = jobs[position].url;
    if (await canLaunch(currentUrl)) {
      await launch(currentUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (jobs.length == 0) {
      updateJobs();
    }

    return Container(
        child: RefreshIndicator(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
        itemCount: jobs.length,
        itemBuilder: (context, position) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            child: ListTile(
              title: Text(jobs[position].title),
              subtitle: Text(jobs[position].url),
              onTap: () {
                openBrowser(position);
                // Navigator.of(context)
                //     .pushNamed("/home/jobs", arguments: jobs[position]);
              },
            ),
            actions: [
              // IconSlideAction(
              //     caption: 'Favorite',
              //     color: Colors.yellow,
              //     icon: Icons.star,
              //     // onTap: () => openBrowser(position),
              //     onTap: () => {}),
            ],
            secondaryActions: [
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
      onRefresh: updateJobs,
    ));
  }
}
