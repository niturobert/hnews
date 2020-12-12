import 'package:flutter/material.dart';
import 'package:hnews/api/v0/ApiItem.dart';

class AskItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AskItemState();
}

class _AskItemState extends State<AskItem> {
  @override
  Widget build(BuildContext context) {
    ApiItem currentAsk = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(currentAsk.title)),
    );
  }
}