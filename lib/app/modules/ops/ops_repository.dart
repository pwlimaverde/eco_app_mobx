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

  Future<List<RegistModel>> getOps() async{
    var url = BASE_URL;
    var urlOps = REGIST_URL;
    var header = {
      "Authorization": "Token${store.storage.read(key: "tolek")}",
      "Content-type": "application/json",
    };

    var response = await http.get(url+urlOps, headers: header);

    return controller.listGetAll(json.decode(response.body));

  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
