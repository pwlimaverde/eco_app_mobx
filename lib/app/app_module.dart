import 'package:eco_app_mobx/app/app_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:eco_app_mobx/app/app_widget.dart';
import 'shared/global/loginbutton/loginbutton_controller.dart';
import 'shared/global/menudrawer/menudrawer_controller.dart';
import 'shared/modules/login/login_controller.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => MenudrawerController()),
        Bloc((i) => LoginbuttonController()),
        Bloc((i) => LoginController()),
        Bloc((i) => AppController()),
      ];

  @override
  List<Dependency> get dependencies => [
      ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
