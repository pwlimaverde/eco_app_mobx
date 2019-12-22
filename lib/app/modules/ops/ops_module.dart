import 'package:eco_app_mobx/app/modules/ops/widgets/listtilesise/listtilesise_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/sizedboxw2/sizedboxw2_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/horizontaldivider/horizontaldivider_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/verticaldivider/verticaldivider_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/sizedboxl2/sizedboxl2_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/listops/listops_controller.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_page.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_repository.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_controller.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class OpsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => ListtilesiseController()),
        Bloc((i) => Sizedboxw2Controller()),
        Bloc((i) => HorizontaldividerController()),
        Bloc((i) => VerticaldividerController()),
        Bloc((i) => Sizedboxl2Controller()),
        Bloc((i) =>
            ListopsController(OpsModule.to.getDependency<OpsRepository>())),
        Bloc((i) => OpsController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => OpsRepository()),
      ];

  @override
  Widget get view => OpsPage();

  static Inject get to => Inject<OpsModule>.of();
}
