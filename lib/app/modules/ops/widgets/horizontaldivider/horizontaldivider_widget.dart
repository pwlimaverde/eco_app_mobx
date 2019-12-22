import 'package:flutter/material.dart';

class HorizontaldividerWidget extends StatelessWidget {
  var controller;
  var tk;

  HorizontaldividerWidget({this.controller, this.tk});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.getQuery(context, 100),
      child: Divider(
        thickness: tk ?? 2,
        height: 20,
        color: Colors.black54,
      ),
    );
  }
}
