import 'package:flutter/material.dart';
import 'package:eco_app_mobx/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecoprint',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeModule(),
    );
  }
}
