import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'model/regist_model.dart';
part 'ops_controller.g.dart';

class OpsController = _OpsBase with _$OpsController;

abstract class _OpsBase with Store {

  @observable
  Orientation orientation;

  @observable
  ObservableList<RegistModel> listAllOps = ObservableList<RegistModel>();

  @observable
  ObservableList<RegistModel> listProdOps = ObservableList<RegistModel>();

  @observable
  ObservableList<RegistModel> listEntOps = ObservableList<RegistModel>();



  @action
  upProd(int id) async {
    RegistModel ent = listProdOps.singleWhere((item) => item.id == id);
    print("${ent.op.op} - ${ent.id}");
    listProdOps.removeWhere((item) => item.id == id);
    listEntOps.add(ent);
  }

  @action
  upEnt(int id) async {
    listEntOps.removeWhere((item) => item.id == id);
  }

  @action
  getOrientation(context) {
    orientation = MediaQuery.of(context).orientation;
  }

  @action
  getQuery(context, med) {
    Size size = MediaQuery.of(context).size;
    orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
      var sizeL = size.width;
      var prop = ((med * sizeL) / 100) - 16;
      return prop;
    }

    var sizeR = size.width;
    var prop = ((med * sizeR) / 100) - 16;
    return prop;
  }

  getSize(size, med) {
    var prop = ((size * med) / 100);
    return prop;
  }

  getQueryH(context, med) {
    Size size = MediaQuery.of(context).size;
    var sizeL = size.width;
    var sizeP = size.height;
    Orientation landscapeOk = MediaQuery.of(context).orientation;
    var siseOk = landscapeOk == Orientation.landscape ? sizeP : sizeL;

    var prop = ((med * siseOk) / 100) - 30;

    return prop;
  }
}
