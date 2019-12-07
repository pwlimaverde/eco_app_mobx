import 'package:eco_app_mobx/app/shared/modules/login/login_module.dart';
import 'package:flutter/material.dart';

class RowloginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Center(
          child: IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              _navLoginPage(context);
            },
          ),
        ),
        Container(
          height: 10,
          width: 10,
        ),
      ],
    );
  }
}

_navLoginPage(BuildContext context, {bool replace = false}) {

  if(replace){
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginModule()),
    );
  }
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoginModule()),
  );
}
