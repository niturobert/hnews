import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ApiItem.dart';

Future<ApiItem> getItemFromId(String id) async {
  ApiItem returnItem = new ApiItem();

  var itemDetails =
      await http.get("https://hacker-news.firebaseio.com/v0/item/${id}.json");
  var output = await jsonDecode(itemDetails.body);

  returnItem.id = id;
  returnItem.title = output['title'] == null ? "No Title" : output['title'];
  returnItem.score = output['score'] == null ? "0" : output['score'];
  returnItem.by = output['by'] == null ? 'no author' : output['by'];
  returnItem.type = output['type'] == null ? 'unknown' : output['type'];
  returnItem.url = output['url'] == null
      ? 'https://news.ycombinator.com/item?id=$id'
      : output['url'];
  returnItem.descendants = output['descendants'];

  return returnItem;
}

List<ApiItem> getCommentsFromId(String id) {
  List<ApiItem> comments = [];

  comments.add(new ApiItem(
    title: "Hello World",
    type: "comment",
  ));
  comments.add(new ApiItem(
    title: "Testing the API",
    type: "comment",
  ));

  return comments;
}
