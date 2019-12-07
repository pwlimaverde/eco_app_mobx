import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginBase with _$LoginController;

abstract class _LoginBase with Store {

  final formKey = GlobalKey<FormState>();
  final crtlLogin = TextEditingController();
  final crtlSenha = TextEditingController();
  final focusSenha = FocusNode();
  final focusLogin = FocusNode();
  final focusConfirma = FocusNode();



  String validaLogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o Login";
    }
    return null;
  }

  String validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite a Senha";
    }
    return null;
  }


  //dispose will be called automatically
  @override
  void dispose() {}

}
