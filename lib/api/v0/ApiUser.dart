import "package:flutter/foundation.dart";
import 'package:hnews/api/v0/ApiItem.dart';

// Documentation from https://github.com/HackerNews/API#users
class ApiUser {
  String id;              // The user's unique username. Case-sensitive. Required.
  int delay;              // Delay in minutes between a comment's creation and its visibility to other users.
  int created;            // Creation date of the user, in Unix Time.
  int karma;              // The user's karma.
  String about;           // The user's optional self-description. HTML.
  List<int> submitted;    // List of the user's stories, polls and comments.

  ApiUser({this.id, this.delay, this.created, this.karma, this.about, this.submitted});
}