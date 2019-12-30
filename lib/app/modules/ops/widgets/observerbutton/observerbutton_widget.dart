import 'package:eco_app_mobx/app/modules/ops/widgets/circularprogress/circularprogress_widget.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/iconbutton/iconbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObserverbuttonWidget extends StatelessWidget {
  bool crt;
  bool upProd;
  bool cancelarOP;
  bool reativarOP;
  IconData icon;
  Color color;
  var id;
  var controller;

  ObserverbuttonWidget(
      {this.crt,
      this.upProd,
      this.id,
      this.color,
      this.icon,
      this.cancelarOP,
      this.controller,
          this.reativarOP
      });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (cancelarOP == true) {
        if (controller.clickLoadCan == true) {
          if (crt == true) {
            return CircularprogressWidget(
              left: 0,
              right: 0,
              top: 14,
              bottom: 14,
              swidth: 20,
              sheight: 20,
              strok: 2,
              color: color,
            );
          }
          return IconbuttonWidget(
              icon: icon,
              color: color,
              onPressed: () {
                crt = true;
                if(reativarOP == true){
                    controller.actionCan(context, id, reativar: reativarOP);
                    return;
                }
                controller.actionCan(context, id);
              });
        }
        return IconbuttonWidget(
            icon: icon,
            color: color,
            onPressed: () {
                crt = true;
                if(reativarOP == true){
                    controller.actionCan(context, id, reativar: reativarOP);
                    return;
                }
                controller.actionCan(context, id);
            });
      } else {
        if (controller.clickLoadOK == true) {
          if (crt == true) {
            return CircularprogressWidget(
              left: 0,
              right: 0,
              top: 14,
              bottom: 14,
              swidth: 20,
              sheight: 20,
              strok: 2,
              color: color,
            );
          }
          return IconbuttonWidget(
              icon: icon,
              color: color,
              onPressed: () {
                crt = true;
                if (upProd == true) {
                  controller.actionUpLoad(context, id, prod: upProd);
                  return;
                }
                controller.actionUpLoad(context, id, prod: upProd);
              });
        }
        return IconbuttonWidget(
            icon: icon,
            color: color,
            onPressed: () {
              crt = true;
              if (upProd == true) {
                controller.actionUpLoad(context, id, prod: upProd);
                return;
              }
              controller.actionUpLoad(context, id, prod: upProd);
            });
      }
    });
  }
}
