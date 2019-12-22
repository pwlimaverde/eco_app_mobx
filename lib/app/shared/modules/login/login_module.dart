import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';
import 'login_service.dart';
import 'widgets/button/button_controller.dart';
import 'widgets/field/field_controller.dart';

class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) =>
            ButtonController(LoginModule.to.getDependency<LoginRepository>())),
        Bloc((i) => FieldController()),
        Bloc((i) => LoginController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => LoginService()),
        Dependency((i) => LoginRepository()),
      ];

  @override
  Widget get view => LoginPage();

  static Inject get to => Inject<LoginModule>.of();
}
