import 'package:eco_app_mobx/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';

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