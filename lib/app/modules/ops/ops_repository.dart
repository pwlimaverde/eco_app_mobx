import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_module.dart';
import 'package:eco_app_mobx/app/modules/ops/utilitario/alert.dart';
import 'package:eco_app_mobx/app/modules/ops/utilitario/constants.dart';
import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../app_module.dart';
import 'model/regist_model.dart';
import 'ops_controller.dart';

class OpsRepository extends Disposable {
  final controller = OpsModule.to.getBloc<OpsController>();
  final store = AppModule.to.bloc<LoginbuttonController>();

  Future<bool> getOps() async {
    try {
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var header = {
        "Authorization": "Token ${await store.storage.read(key: "token")}",
        "Content-type": "application/json",
      };

      var response = await http.get(url + urlOps, headers: header);

      if (response.statusCode == 200) {
        List list = json.decode(response.body);
        final ops =
            list.map<RegistModel>((map) => RegistModel.fromJson(map)).toList();

        controller.listAllOps.clear();
        controller.listProdOps.clear();
        controller.listEntOps.clear();
        controller.listAllOps.addAll(ops);
        for (RegistModel prod in ops) {
          if (prod.produzido == null && prod.cancelada == false) {
            controller.listProdOps.add(prod);
          }
        }
        for (RegistModel ent in ops) {
          if (ent.produzido != null &&
              ent.entrega == null &&
              ent.cancelada == false) {
            controller.listEntOps.add(ent);
          }
        }
        controller.getErrorApi(false);
        return controller.errorApi;
      }

      controller.getErrorApi(true);
      return controller.errorApi;
    } catch (e) {
      controller.getErrorApi(true);
      return controller.errorApi;
    }
  }

  Future upProd(context, int id) async {
    try {
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var urlUpProd = UPPROD_URL;
      var header = {
        "Authorization": "Token ${await store.storage.read(key: "token")}",
        "Content-type": "application/json",
      };

      var response = await http.patch(url + urlOps + "$id" + urlUpProd, headers: header);

      if(response.statusCode == 200){
        await controller.upProd(id);
        return;
      }

      _alertaError(context, "Erro ao processar a produção");

    } catch (e) {

      _alertaError(context, "Erro ao processar a produção");

    }
  }

  Future upEnt(context, int id) async {
    try {
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var urlUpEnt = UPENT_URL;
      var header = {
        "Authorization": "Token ${await store.storage.read(key: "token")}",
        "Content-type": "application/json",
      };

      var response = await http.patch(url + urlOps + "$id" + urlUpEnt, headers: header);

      if(response.statusCode == 200){
        await controller.upEnt(id);
        return;
      }

      _alertaError(context, "Erro ao processar a entrada");

    } catch (e) {

      _alertaError(context, "Erro ao processar a entrada");

    }
  }

  Future canProd(context, int id) async {
    try {
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var urlCanProd = CANPROD_URL;
      var header = {
        "Authorization": "Token ${await store.storage.read(key: "token")}",
        "Content-type": "application/json",
      };

      var response = await http.patch(url + urlOps + "$id" + urlCanProd, headers: header);

      if(response.statusCode == 200){
        await getOps();
        return;
      }

      _alertaError(context, "Erro ao processar o cancelamento");

    } catch (e) {

      _alertaError(context, "Erro ao processar o cancelamento");

    }
  }

  Future atProd(context, int id) async {
    try {
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var urlAtProd = ATPROD_URL;
      var header = {
        "Authorization": "Token ${await store.storage.read(key: "token")}",
        "Content-type": "application/json",
      };

      var response = await http.patch(url + urlOps + "$id" + urlAtProd, headers: header);

      if(response.statusCode == 200){
        await getOps();
        return;
      }

      _alertaError(context, "Erro ao processar a reversão cancelamento");

    } catch (e) {

      _alertaError(context, "Erro ao processar a reversão cancelamento");

    }
  }

  Future _alertaError(context, msg) async {
    alertProgress(context, msg);
    await getOps();
    Future.delayed(Duration(seconds: 1), (){
      Navigator.pop(context);
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
