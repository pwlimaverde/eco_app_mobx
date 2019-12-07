import 'package:eco_app_mobx/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import '../login_module.dart';


navLoginPage(BuildContext context, {bool replace = false}) {

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

navHomePage(BuildContext context, {bool replace = false}) {
    if(replace){
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeModule()),
        );
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeModule()),
    );
}