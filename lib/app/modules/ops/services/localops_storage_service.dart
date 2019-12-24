//import 'dart:async';
//import 'package:bloc_pattern/bloc_pattern.dart';
//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;
//import '../model/regist_model.dart';
//
//
//class LocalopsStorageService extends Disposable {
//
//  Completer<Box> completerAll = Completer<Box>();
////  Completer<Box> completerProd = Completer<Box>();
////  Completer<Box> completerEnt = Completer<Box>();
//
//  LocalopsStorageService(){
//    _initDB();
//  }
//
//  _initDB() async{
//    final directory = await path_provider.getApplicationDocumentsDirectory();
//    Hive.init(directory.path);
//    final boxAll = await Hive.openBox("allops");
//    if(!completerAll.isCompleted){
//      completerAll.complete(boxAll);
//    }
////    final boxProd = await Hive.openBox("prodops");
////    if(!completerProd.isCompleted){
////      completerProd.complete(boxProd);
////    }
////    final boxEnt = await Hive.openBox("entops");
////    if(!completerEnt.isCompleted){
////      completerEnt.complete(boxEnt);
////    }
//  }
//
//  Future<List<RegistModel>> getAllOps(List<RegistModel> model) async{
//    final boxAll = await completerAll.future;
//    await boxAll.clear();
//    for(RegistModel op in model){
//      print("BOX --> ID: ${op.id} - OP: ${op.op.op}");
//      print("BOX JSON --> ${op.toJson()}");
//      await boxAll.put(op.id, op.toJson());
//    }
//    return model;
//  }
//
////  Future<List<RegistModel>> getProdOps(List jason) async{
////    await getAllOps(jason);
////    final boxAll = await completerAll.future;
////    final boxProd = await completerProd.future;
////    await boxProd.clear();
////    for(Map map in boxAll.values){
////      RegistModel p = RegistModel.fromJson(map);
////      if(p.produzido == null){
////        print("ID: ${p.id} --- OP: ${p.op.op} --- PROD: ${p.produzido}");
////        await boxProd.put(p.id, p.toJson());
////      }
////    }
////    return boxProd.values.map((item) => RegistModel.fromJson(item)).toList();
////  }
//
////  upProd(List json) async{
////    await getAllOps(json);
////  }
//
////  upEnt(int id) async{
////    final boxEnt = await completerEnt.future;
////    await boxEnt.delete(id);
////  }
//
//
//
//  //dispose will be called automatically
//  @override
//  void dispose() async{
////    final boxProd = await completerProd.future;
//    final boxAll = await completerAll.future;
////    boxProd.close();
//    boxAll.close();
//  }
//}
