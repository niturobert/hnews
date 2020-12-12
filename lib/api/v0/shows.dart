import "package:flutter/foundation.dart";
import "ApiItem.dart";
import "package:http/http.dart" as http;

Future<List<String>> getShows({int limit = 10}) async {
  List<String> response = [];

  var buffer =
      await http.get("https://hacker-news.firebaseio.com/v0/showstories.json");
  List<String> postIds =
      buffer.body.substring(1, buffer.body.length - 1).split(",");

  for (var post in postIds) {
    if (limit <= 0) {
      break;
    }

    response.add(post);
    limit--;
  }

  return response;
}
