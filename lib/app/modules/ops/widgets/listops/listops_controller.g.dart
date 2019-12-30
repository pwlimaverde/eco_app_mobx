// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listops_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListopsController on _ListopsBase, Store {
  final _$clickLoadOKAtom = Atom(name: '_ListopsBase.clickLoadOK');

  @override
  bool get clickLoadOK {
    _$clickLoadOKAtom.context.enforceReadPolicy(_$clickLoadOKAtom);
    _$clickLoadOKAtom.reportObserved();
    return super.clickLoadOK;
  }

  @override
  set clickLoadOK(bool value) {
    _$clickLoadOKAtom.context.conditionallyRunInAction(() {
      super.clickLoadOK = value;
      _$clickLoadOKAtom.reportChanged();
    }, _$clickLoadOKAtom, name: '${_$clickLoadOKAtom.name}_set');
  }

  final _$clickLoadCanAtom = Atom(name: '_ListopsBase.clickLoadCan');

  @override
  bool get clickLoadCan {
    _$clickLoadCanAtom.context.enforceReadPolicy(_$clickLoadCanAtom);
    _$clickLoadCanAtom.reportObserved();
    return super.clickLoadCan;
  }

  @override
  set clickLoadCan(bool value) {
    _$clickLoadCanAtom.context.conditionallyRunInAction(() {
      super.clickLoadCan = value;
      _$clickLoadCanAtom.reportChanged();
    }, _$clickLoadCanAtom, name: '${_$clickLoadCanAtom.name}_set');
  }

  final _$actionUpLoadAsyncAction = AsyncAction('actionUpLoad');

  @override
  Future actionUpLoad(dynamic context, int id, {bool prod = false}) {
    return _$actionUpLoadAsyncAction
        .run(() => super.actionUpLoad(context, id, prod: prod));
  }

  final _$actionCanAsyncAction = AsyncAction('actionCan');

  @override
  Future actionCan(dynamic context, int id, {bool reativar = false}) {
    return _$actionCanAsyncAction
        .run(() => super.actionCan(context, id, reativar: reativar));
  }
}
