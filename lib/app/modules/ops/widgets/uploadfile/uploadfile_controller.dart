import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'uploadfile_controller.g.dart';

class UploadfileController = _UploadfileBase with _$UploadfileController;

abstract class _UploadfileBase with Store {

//  final formKey = GlobalKey<FormState>();
//  final crtlUpload = TextEditingController();
//
//
//  upWid(){
//    return Column(
//      children: <Widget>[
//        Form(
//            key: formKey,
//            child: FieldWidget(
//              "Descreção",
//              "Digite a Descrição",
//              style: style,
//              controller: crtlUpload,
//              validator: validaUpload,
//              textInputAction: TextInputAction.next,
//            )),
//      ],
//    );
//  }
//  String validaUpload(String texto) {
//    if (texto.isEmpty) {
//      return "Digite a Descrição";
//    }
//    return null;
//  }
//
//  startFilePicker(context) async {
//    InputElement uploadInput = FileUploadInputElement();
//    uploadInput.click();
//
//    uploadInput.onChange.listen((e) {
//      // read file content as dataURL
//      final files = uploadInput.files;
//      if (files.length == 1) {
//        final file = files[0];
//        final reader = new FileReader();
//
//        reader.onLoadEnd.listen((e) {
//          uploadOps(context, descricao: crtlUpload.text, file: file);
//          print("foi para up2");
////          _handleResult(reader.result);
//        });
//        reader.readAsDataUrl(file);
//      }
//    });
//  }
//
//  uploadOps(context, {String descricao, File file}) async {
//    print(descricao);
//    try {
//      var url = BASE_URL;
//      var urlUploadOps = UPLOADOPS_URL;
//      var header = {
//        "Authorization": "Token ${await store.storage.read(key: "token")}",
//        "Content-type": "application/json",
//      };
//
//      var body = {
//        "descricao": "$descricao",
//        "arquivo": file,
//      };
//
//      var response = await http.patch(url + urlUploadOps, headers: header, body: body);
//      print(response.body);
//
//      if(response.statusCode == 200){
//        print("arquvo enviado");
//        return;
//      }
//
//      print(response.statusCode);
//      _alertaError(context, "Erro ao processar a produção");
//
//    } catch (e) {
//
//      print(e);
//      _alertaError(context, "Erro ao processar a produção");
//
//    }
//  }
//
//  Future _alertaError(context, msg) async {
//    alertProgress(context, msg);
//    Future.delayed(Duration(seconds: 1), (){
//      Navigator.pop(context);
//    });
//  }
}
