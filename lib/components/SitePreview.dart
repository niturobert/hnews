import 'dart:io';

import 'package:flutter/material.dart';

class SitePreview extends StatefulWidget {
  String url;

  SitePreview({@required this.url}): super();

  @override
  State<StatefulWidget> createState() => _SitePreviewState(url: this.url);
}


class _SitePreviewState extends State<SitePreview> {
  String url;
  _SitePreviewState({@required this.url}): super();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FittedBox(
        child: Image.asset("assets/img/hnlogo.jpg"),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}