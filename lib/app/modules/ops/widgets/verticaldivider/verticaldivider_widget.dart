import 'package:flutter/material.dart';

class VerticaldividerWidget extends StatelessWidget {

  var controller;
  var size;
  var tk;

  VerticaldividerWidget({this.controller, this.size, this.tk});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.getQuery(context, size),
      child: VerticalDivider(
        thickness: tk ?? 2,
        color: Colors.black54,
      ),
    );
  }
}
