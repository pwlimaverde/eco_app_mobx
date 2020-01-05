import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_widget.dart';
import 'package:eco_app_mobx/app/shared/global/menudrawer/menudrawer_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Sistema Ecoprint"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          LoginbuttonWidget(),
        ],
      ),
      drawer: MenudrawerWidget(),
      body: Column(
        children: <Widget>[
        ],
      ),
    );
  }
}
