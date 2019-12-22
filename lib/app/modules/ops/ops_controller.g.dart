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

  final _$listGetAllResponseAtom = Atom(name: '_OpsBase.listGetAllResponse');

  @override
  List get listGetAllResponse {
    _$listGetAllResponseAtom.context
        .enforceReadPolicy(_$listGetAllResponseAtom);
    _$listGetAllResponseAtom.reportObserved();
    return super.listGetAllResponse;
  }

  @override
  set listGetAllResponse(List value) {
    _$listGetAllResponseAtom.context.conditionallyRunInAction(() {
      super.listGetAllResponse = value;
      _$listGetAllResponseAtom.reportChanged();
    }, _$listGetAllResponseAtom, name: '${_$listGetAllResponseAtom.name}_set');
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

  @override
  dynamic listGetAll(List json) {
    final _$actionInfo = _$_OpsBaseActionController.startAction();
    try {
      return super.listGetAll(json);
    } finally {
      _$_OpsBaseActionController.endAction(_$actionInfo);
    }
  }
}