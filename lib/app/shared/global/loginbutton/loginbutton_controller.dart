import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';

part 'loginbutton_controller.g.dart';

class LoginbuttonController = _LoginbuttonBase with _$LoginbuttonController;

abstract class _LoginbuttonBase with Store {

  final storage = FlutterSecureStorage();

  @observable
  String logado = "sem login";

  @action
  getData() async {
    String login = await storage.read(key: "username");
    return login;
  }

  @action
  logout() async {
    await storage.deleteAll();
    logado = "sem login";
  }

  @action
  addNovoLogin() async {
    logado = await storage.read(key: "username");
  }

}
