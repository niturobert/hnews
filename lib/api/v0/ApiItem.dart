import "package:flutter/foundation.dart";

// Documentation from https://github.com/HackerNews/API#items
class ApiItem {
  String id;             // The item's unique id.
  bool deleted;       // true if the item is deleted.
  String type;        // The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  String by;          // The username of the item's author.
  int time;           // Creation date of the item, in Unix Time.
  String text;        // The comment, story or poll text. HTML.
  bool dead;          // true if the item is dead.
  var parent;         // The comment's parent: either another comment or the relevant story.
  var poll;           // The pollopt's associated poll.
  List<int> kids;     // The ids of the item's comments, in ranked display order.
  String url;         // The URL of the story.
  var score;          // The story's score, or the votes for a pollopt.
  String title;       // The title of the story, poll or job. HTML.
  List parts;         // A list of related pollopts, in display order.
  int descendants;    // In the case of stories or polls, the total comment count.

  ApiItem({this.id, this.deleted, this.type, this.by, this.time, this.text, this.dead, this.parent, this.poll, this.kids, this.url, this.score, this.title, this.parts, this.descendants});
}