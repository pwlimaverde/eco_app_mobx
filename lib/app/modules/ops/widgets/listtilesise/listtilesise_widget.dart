import 'package:flutter/material.dart';


class ListtilesiseWidget extends StatefulWidget {

  var controller;
  var sizeGeral;
  var sizeCont;
  var sizeFontTile;
  var sizeFontSubTile;
  var line;
  var threeLine;
  String title;
  String subTile;


  ListtilesiseWidget({this.controller, this.sizeGeral, this.sizeCont,
      this.sizeFontTile, this.sizeFontSubTile, this.line, this.threeLine,
      this.title, this.subTile});

  @override
  _ListtilesiseWidgetState createState() => _ListtilesiseWidgetState();
}

class _ListtilesiseWidgetState extends State<ListtilesiseWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: widget.controller.getSize(widget.sizeGeral, widget.sizeCont),
      child: ListTile(
        isThreeLine: widget.threeLine ?? false,
        contentPadding: EdgeInsets.all(6),
        title: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: widget.controller.getSize(widget.sizeGeral, widget.sizeFontTile)*0.75, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.subTile,
          maxLines: widget.line ?? 1,
          style: TextStyle(
              fontSize: widget.controller.getSize(widget.sizeGeral, widget.sizeFontSubTile)*0.75),
        ),
      ),
    );
  }
}
