import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_module.dart';
import 'package:eco_app_mobx/app/modules/ops/utilitario/constants.dart';
import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:http/http.dart' as http;
import '../../app_module.dart';
import 'model/regist_model.dart';
import 'ops_controller.dart';


class OpsRepository extends Disposable {

  final controller = OpsModule.to.getBloc<OpsController>();
  final store = AppModule.to.bloc<LoginbuttonController>();

  Future getOps() async{
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var header = {
          "Authorization": "Token ${await store.storage.read(key: "token")}",
          "Content-type": "application/json",
      };

      var response = await http.get(url+urlOps, headers: header);

      List list = json.decode(response.body);
      final ops = list.map<RegistModel>((map) => RegistModel.fromJson(map)).toList();

      controller.listAllOps.clear();
      controller.listProdOps.clear();
      controller.listEntOps.clear();
      controller.listAllOps.addAll(ops);
      for(RegistModel op in ops){
          if(op.produzido == null){
              print("BOX PROD --> ID: ${op.id} - OP: ${op.op.op} - OP: ${op.op.id}");
              controller.listProdOps.add(op);
          }
      }
      for(RegistModel op in ops){
          if(op.produzido != null){
              print("BOX EXPED --> ID: ${op.id} - OP: ${op.op.op} - OP: ${op.op.id}");
              controller.listEntOps.add(op);
          }
      }
  }

  Future upProd(int id) async{
    var url = BASE_URL;
    var urlOps = REGIST_URL;
    var urlUpProd = UPPROD_URL;
    var header = {
      "Authorization": "Token ${await store.storage.read(key: "token")}",
      "Content-type": "application/json",
    };

    await http.patch(url+urlOps+"$id"+urlUpProd, headers: header);
    await controller.upProd(id);
  }

  Future upEnt(int id) async{
      var url = BASE_URL;
      var urlOps = REGIST_URL;
      var urlUpEnt = UPENT_URL;
      var header = {
          "Authorization": "Token ${await store.storage.read(key: "token")}",
          "Content-type": "application/json",
      };

      await http.patch(url+urlOps+"$id"+urlUpEnt, headers: header);
      await controller.upEnt(id);
  }


  //dispose will be called automatically
  @override
  void dispose() {}
}
