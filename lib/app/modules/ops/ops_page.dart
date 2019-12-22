import 'package:flutter/material.dart';

import 'widgets/listops/listops_widget.dart';

class OpsPage extends StatefulWidget {
  final String title;
  const OpsPage({Key key, this.title = "Ops"}) : super(key: key);

  @override
  _OpsPageState createState() => _OpsPageState();
}

class _OpsPageState extends State<OpsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(tabs: [
            Tab(text: "Em Produção",),
            Tab(text: "Em Expedição",),
            Tab(text: "Todas as Ops",),
          ]),
        ),
        body: TabBarView(children: [
          ListopsWidget(),
          ListopsWidget(),
          ListopsWidget(),
        ]),
      ),
    );
  }
}
