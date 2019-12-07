import 'dart:convert';
import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc_pattern/bloc_pattern.dart';
import '../../../app_module.dart';
import 'utilitario/alert.dart';
import 'utilitario/api_response.dart';
import 'utilitario/constants.dart';


class LoginRepository extends Disposable {

  final store = AppModule.to.bloc<LoginbuttonController>();

  Future<ApiResponse> loginUsers(context, String username, String password) async {
    alertProgress(context, "Aguarde");
    try{
      var userLogado;
      var url = BASE_URL;
      var urlToken = TOKEN_URL;
      var header = {
        "Content-type": "application/json",
      };
      Map params = {
        "username": username,
        "password": password,
      };
      var _body = json.encode(params);

      var response = await http.post(url+urlToken, headers: header, body: _body);
      Map mapResponse = json.decode(response.body);
      print(mapResponse);

      if (response.statusCode == 200) {
        await store.storage.write(key: "token", value: mapResponse["token"]);
        await store.storage.write(key: "username", value: params["username"]);
        await store.storage.write(key: "password", value: params["password"]);
        store.addNovoLogin();
        userLogado = await store.storage.read(key: "username");
        print(userLogado);
        Navigator.pop(context);
        return ApiResponse.ok(userLogado);
      }
      Navigator.pop(context);
      return ApiResponse.error(mapResponse["non_field_errors"].toString());
    }catch(e){
      Navigator.pop(context);
      return ApiResponse.error("Não foi possível fazer o login. Verifique sua Conexão.");
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
