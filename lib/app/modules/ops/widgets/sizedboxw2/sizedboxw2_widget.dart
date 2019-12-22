import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sizedboxw2Widget extends StatelessWidget {
  var controller;
  int box1;
  int box2;
  int box3;
  String textBox1;
  String textBox2;
  int line;

  Sizedboxw2Widget(
      {this.controller,
      this.box1,
      this.box2,
      this.box3,
      this.textBox1,
      this.textBox2,
      this.line});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.getQueryH(context, box1 + box2),
      width: controller.getQuery(context, box3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: controller.getQueryH(context, box1),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(textBox1),
            ),
          ),
          SizedBox(
            height: controller.getQueryH(context, box2),
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(textBox2,
                  maxLines: line ?? 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
