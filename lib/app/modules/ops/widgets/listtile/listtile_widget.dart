import 'package:flutter/material.dart';

import '../../model/regist_model.dart';

class ListtileWidget extends StatelessWidget {

  final RegistModel model;
  Function onPressed;

  ListtileWidget({this.model, this.onPressed});

//  const ListtileWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          "ID: ${model.id} - OP: ${model.op.op} - Cliente: ${model.op.cliente}"),
      subtitle: Text("${model.op.servico}"),
      trailing: IconButton(
        icon: Icon(
          Icons.check,
          size: 22,
          color: Colors.green,
        ),
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
      ),
    );
  }
}
