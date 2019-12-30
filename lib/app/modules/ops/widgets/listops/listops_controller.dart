import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../model/regist_model.dart';
import '../../ops_module.dart';
import '../../ops_repository.dart';

part 'listops_controller.g.dart';

class ListopsController = _ListopsBase with _$ListopsController;

abstract class _ListopsBase with Store {
  final controllerRepo = OpsModule.to.getDependency<OpsRepository>();

  @observable
  bool clickLoadOK = false;

  @observable
  bool clickLoadCan = false;

  @action
  actionUpLoad(context, int id, {bool prod = false}) async{
    clickLoadOK = true;
      if(prod == true){
        await controllerRepo.upProd(context, id);
      } else{
        await controllerRepo.upEnt(context, id);
      }
      clickLoadOK = false;
  }

  @action
  actionCan(context, int id, {bool reativar = false}) async{
    clickLoadCan = true;
      if(reativar == true){
        await controllerRepo.atProd(context, id);
      } else{
        await controllerRepo.canProd(context, id);
      }
      clickLoadCan = false;
  }



  getCorCard(RegistModel model) {
    return model.produzido != null && model.entrega != null || model.cancelada == true
        ? Colors.grey[100]
        : model.status.posicao.toLowerCase().contains("atrasado")
            ? Colors.red[100]
            : model.status.posicao.toLowerCase().contains("hoje")
                ? Colors.yellow[100]
                : Colors.grey[100];
  }
}
