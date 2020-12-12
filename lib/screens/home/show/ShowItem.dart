import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';

class ShowItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    ApiItem currentShow = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(currentShow.title)),
    );
  }
}