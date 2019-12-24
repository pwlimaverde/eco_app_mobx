// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ops_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OpsController on _OpsBase, Store {
  final _$orientationAtom = Atom(name: '_OpsBase.orientation');

  @override
  Orientation get orientation {
    _$orientationAtom.context.enforceReadPolicy(_$orientationAtom);
    _$orientationAtom.reportObserved();
    return super.orientation;
  }

  @override
  set orientation(Orientation value) {
    _$orientationAtom.context.conditionallyRunInAction(() {
      super.orientation = value;
      _$orientationAtom.reportChanged();
    }, _$orientationAtom, name: '${_$orientationAtom.name}_set');
  }

  final _$listAllOpsAtom = Atom(name: '_OpsBase.listAllOps');

  @override
  ObservableList<RegistModel> get listAllOps {
    _$listAllOpsAtom.context.enforceReadPolicy(_$listAllOpsAtom);
    _$listAllOpsAtom.reportObserved();
    return super.listAllOps;
  }

  @override
  set listAllOps(ObservableList<RegistModel> value) {
    _$listAllOpsAtom.context.conditionallyRunInAction(() {
      super.listAllOps = value;
      _$listAllOpsAtom.reportChanged();
    }, _$listAllOpsAtom, name: '${_$listAllOpsAtom.name}_set');
  }

  final _$listProdOpsAtom = Atom(name: '_OpsBase.listProdOps');

  @override
  ObservableList<RegistModel> get listProdOps {
    _$listProdOpsAtom.context.enforceReadPolicy(_$listProdOpsAtom);
    _$listProdOpsAtom.reportObserved();
    return super.listProdOps;
  }

  @override
  set listProdOps(ObservableList<RegistModel> value) {
    _$listProdOpsAtom.context.conditionallyRunInAction(() {
      super.listProdOps = value;
      _$listProdOpsAtom.reportChanged();
    }, _$listProdOpsAtom, name: '${_$listProdOpsAtom.name}_set');
  }

  final _$listEntOpsAtom = Atom(name: '_OpsBase.listEntOps');

  @override
  ObservableList<RegistModel> get listEntOps {
    _$listEntOpsAtom.context.enforceReadPolicy(_$listEntOpsAtom);
    _$listEntOpsAtom.reportObserved();
    return super.listEntOps;
  }

  @override
  set listEntOps(ObservableList<RegistModel> value) {
    _$listEntOpsAtom.context.conditionallyRunInAction(() {
      super.listEntOps = value;
      _$listEntOpsAtom.reportChanged();
    }, _$listEntOpsAtom, name: '${_$listEntOpsAtom.name}_set');
  }

  final _$upProdAsyncAction = AsyncAction('upProd');

  @override
  Future upProd(int id) {
    return _$upProdAsyncAction.run(() => super.upProd(id));
  }

  final _$upEntAsyncAction = AsyncAction('upEnt');

  @override
  Future upEnt(int id) {
    return _$upEntAsyncAction.run(() => super.upEnt(id));
  }

  final _$_OpsBaseActionController = ActionController(name: '_OpsBase');

  @override
  dynamic getOrientation(dynamic context) {
    final _$actionInfo = _$_OpsBaseActionController.startAction();
    try {
      return super.getOrientation(context);
    } finally {
      _$_OpsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getQuery(dynamic context, dynamic med) {
    final _$actionInfo = _$_OpsBaseActionController.startAction();
    try {
      return super.getQuery(context, med);
    } finally {
      _$_OpsBaseActionController.endAction(_$actionInfo);
    }
  }
}
