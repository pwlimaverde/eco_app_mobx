import 'package:date_format/date_format.dart';
import 'package:eco_app_mobx/app/modules/ops/model/regist_model.dart';
import 'package:eco_app_mobx/app/modules/ops/ops_module.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/horizontaldivider/horizontaldivider_widget.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/listtilesise/listtilesise_widget.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/sizedboxl2/sizedboxl2_widget.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/sizedboxw2/sizedboxw2_widget.dart';
import 'package:eco_app_mobx/app/modules/ops/widgets/verticaldivider/verticaldivider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../ops_controller.dart';
import 'listops_controller.dart';

final controller = OpsModule.to.getBloc<ListopsController>();
final controllerGeral = OpsModule.to.getBloc<OpsController>();

class ListopsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RegistModel>>(
      future: controller.repo.getOps(),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              "Não foi possível listar as Ops",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<RegistModel> ops = snapshot.data;
        return _listOpsProdL(context, ops);
      },
    );
  }

  _listOpsProdL(context, List<RegistModel> ops) {
    controllerGeral.getOrientation(context);
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: ops != null ? ops.length : 0,
          itemBuilder: (context, index) {
            RegistModel o = ops[index];
            var size = controllerGeral.getQuery(context, 100);
            return Card(
              child: Container(
                color: o.status.posicao.toLowerCase().contains("atrasado")
                    ? Colors.red[100]
                    : o.status.posicao.toLowerCase().contains("hoje")
                        ? Colors.yellow[100]
                        : Colors.grey[100],
                width: size,
                child: Row(
                  children: <Widget>[
                    ListtilesiseWidget(
                      controller: controllerGeral,
                      sizeGeral: size,
                      sizeCont: 10,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "OP: ${o.op.op}",
                      subTile: "Entrada: ${formatDate(
                        DateTime(
                            int.parse("${o.op.entrada.substring(0, 4)}"),
                            int.parse("${o.op.entrada.substring(6, 7)}"),
                            int.parse("${o.op.entrada.substring(9, 10)}")),
                        [dd, "/", mm],
                      )}",
                    ),
                    ListtilesiseWidget(
                      controller: controllerGeral,
                      threeLine: true,
                      line: 3,
                      sizeGeral: size,
                      sizeCont: 60,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title:
                          "Cliente: ${o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente}",
                      subTile:
                          "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
                    ),
                    ListtilesiseWidget(
                      controller: controllerGeral,
                      sizeGeral: size,
                      sizeCont: 10,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "QT: ${o.op.quant}",
                      subTile:
                          "Vend: ${o.op.vendedor.length >= 8 ? o.op.vendedor.substring(0, 8) : o.op.vendedor}",
                    ),
                    ListtilesiseWidget(
                      controller: controllerGeral,
                      threeLine: true,
                      line: 3,
                      sizeGeral: size,
                      sizeCont: 15,
                      sizeFontTile: 2.2,
                      sizeFontSubTile: 1.5,
                      title: "Entrega: ${formatDate(
                        DateTime(
                            int.parse("${o.prevEntrega.substring(0, 4)}"),
                            int.parse("${o.prevEntrega.substring(6, 7)}"),
                            int.parse("${o.prevEntrega.substring(9, 10)}")),
                        [dd, "/", mm],
                      )}",
                      subTile:
                          "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                    ),
                    Container(
                      width: controllerGeral.getSize(size, 3),
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.check,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: () => print("teste v ${o.id}"),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.clear,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: () => print("teste x ${o.id}"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: ops != null ? ops.length : 0,
        itemBuilder: (context, index) {
          RegistModel o = ops[index];
          var size = controllerGeral.getQuery(context, 100);
          return Card(
            child: Container(
              color: o.status.posicao.toLowerCase().contains("atrasado")
                  ? Colors.red[100]
                  : Colors.grey[100],
              width: size,
              child: Row(
                children: <Widget>[
                  ListtilesiseWidget(
                    controller: controllerGeral,
                    sizeGeral: size,
                    sizeCont: 15,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "OP: ${o.op.op}",
                    subTile: "Entrada: ${formatDate(
                      DateTime(
                          int.parse("${o.op.entrada.substring(0, 4)}"),
                          int.parse("${o.op.entrada.substring(6, 7)}"),
                          int.parse("${o.op.entrada.substring(9, 10)}")),
                      [dd, "/", mm],
                    )}",
                  ),
                  ListtilesiseWidget(
                    controller: controllerGeral,
                    threeLine: true,
                    line: 3,
                    sizeGeral: size,
                    sizeCont: 45,
                    sizeFontTile: 2.2,
                    sizeFontSubTile: 1.5,
                    title:
                        "Cliente: ${o.op.cliente.length >= 35 ? o.op.cliente.substring(0, 35) : o.op.cliente}",
                    subTile:
                        "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
                  ),
                  ListtilesiseWidget(
                    controller: controllerGeral,
                    sizeGeral: size,
                    sizeCont: 15,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "QT: ${o.op.quant}",
                    subTile:
                        "Vend: ${o.op.vendedor.length >= 8 ? o.op.vendedor.substring(0, 8) : o.op.vendedor}",
                  ),
                  ListtilesiseWidget(
                    controller: controllerGeral,
                    threeLine: true,
                    line: 3,
                    sizeGeral: size,
                    sizeCont: 20,
                    sizeFontTile: 3.5,
                    sizeFontSubTile: 2.5,
                    title: "Entrega: ${formatDate(
                      DateTime(
                          int.parse("${o.prevEntrega.substring(0, 4)}"),
                          int.parse("${o.prevEntrega.substring(6, 7)}"),
                          int.parse("${o.prevEntrega.substring(9, 10)}")),
                      [dd, "/", mm],
                    )}",
                    subTile:
                        "${o.obs != null ? o.obs.length >= 68 ? o.obs.substring(0, 68) : o.obs : ""}",
                  ),
                  Container(
                    width: controllerGeral.getSize(size, 3),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.check,
                            size: 18,
                          ),
                          padding: EdgeInsets.all(0),
                          onPressed: () => print("teste v ${o.id}"),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 18,
                          ),
                          padding: EdgeInsets.all(0),
                          onPressed: () => print("teste x ${o.id}"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

//  _listOps(context, List<RegistModel> ops) {
//    if (MediaQuery.of(context).orientation == Orientation.landscape) {
//      return Container(
//        padding: EdgeInsets.all(10),
//        child: ListView.builder(
//          itemCount: ops != null ? ops.length : 0,
//          itemBuilder: (context, index) {
//            RegistModel o = ops[index];
//            return Card(
//              color: o.status.posicao.toLowerCase().contains("atrasado")
//                  ? Colors.red[100]
//                  : Colors.grey[100],
//              child: Container(
//                width: controllerGeral.getQuery(context, 100),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(5),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 5,
//                                box2: 8,
//                                box3: 10,
//                                textBox1: "OP: ",
//                                textBox2: "${o.op.op}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 5,
//                                box2: 8,
//                                box3: 11,
//                                textBox1: "Quant: ",
//                                textBox2: "${o.op.quant}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Column(
//                                children: <Widget>[
//                                  Sizedboxw2Widget(
//                                    controller: controllerGeral,
//                                    box1: 4,
//                                    box2: 5,
//                                    box3: 30,
//                                    textBox1: "Cliente: ",
//                                    textBox2:
//                                        "${o.op.cliente.length >= 40 ? o.op.cliente.substring(0, 40) : o.op.cliente}",
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 7,
//                                        textBox1: "Orçamento: ",
//                                        textBox2: "${o.op.orcamento}",
//                                      ),
//                                      VerticaldividerWidget(
//                                        controller: controllerGeral,
//                                        size: 3,
//                                      ),
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 15,
//                                        textBox1: "Vendedor: ",
//                                        textBox2:
//                                            "${o.op.vendedor.length >= 20 ? o.op.vendedor.substring(0, 20) : o.op.vendedor}",
//                                      ),
//                                      VerticaldividerWidget(
//                                        controller: controllerGeral,
//                                        size: 3,
//                                      ),
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 8,
//                                        textBox1: "Entrada: ",
//                                        textBox2:
//                                            "${formatDate(DateTime(int.parse("${o.op.entrada.substring(0, 4)}"), int.parse("${o.op.entrada.substring(6, 7)}"), int.parse("${o.op.entrada.substring(9, 10)}")), [
//                                          dd,
//                                          "/",
//                                          mm,
//                                          "/",
//                                          yy
//                                        ])}",
//                                      ),
//                                    ],
//                                  ),
//                                ],
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 5,
//                                box2: 8,
//                                box3: 13,
//                                textBox1: "Prev. Entrega: ",
//                                textBox2:
//                                    "${formatDate(DateTime(int.parse("${o.prevEntrega.substring(0, 4)}"), int.parse("${o.prevEntrega.substring(6, 7)}"), int.parse("${o.prevEntrega.substring(9, 10)}")), [
//                                  dd,
//                                  "/",
//                                  mm,
//                                  "/",
//                                  yy
//                                ])}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 5,
//                                box2: 6,
//                                box3: 20,
//                                textBox1: "Posição:",
//                                textBox2: "${o.status.posicao}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Container(
//                                child: ButtonBarTheme(
//                                  data: ButtonBarTheme.of(context),
//                                  child: ButtonBar(
//                                    alignment: MainAxisAlignment.end,
//                                    children: <Widget>[
//                                      SizedBox(
//                                        child: IconButton(
//                                          iconSize: 25,
//                                          icon: Icon(Icons.check),
//                                          onPressed: () {},
//                                        ),
//                                        height: 40,
//                                        width: 40,
//                                      ),
//                                      SizedBox(
//                                        child: IconButton(
//                                          iconSize: 25,
//                                          icon: Icon(Icons.cancel),
//                                          onPressed: () {},
//                                        ),
//                                        height: 40,
//                                        width: 45,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                          HorizontaldividerWidget(
//                            controller: controllerGeral,
//                          ),
//                          Sizedboxw2Widget(
//                            controller: controllerGeral,
//                            box1: 4,
//                            box2: 5,
//                            box3: 100,
//                            textBox1: "Serviço: ",
//                            textBox2:
//                                "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            );
//          },
//        ),
//      );
//    }
//    return Container(
//      padding: EdgeInsets.all(10),
//      child: ListView.builder(
//        itemCount: ops != null ? ops.length : 0,
//        itemBuilder: (context, index) {
//          RegistModel o = ops[index];
//          return SingleChildScrollView(
//            scrollDirection: Axis.horizontal,
//            child: Card(
//              color: o.status.posicao.toLowerCase().contains("atrasado")
//                  ? Colors.red[100]
//                  : Colors.grey[100],
//              child: Container(
//                width: controllerGeral.getQuery(context, 100),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(5),
//                      child: Column(
//                        children: <Widget>[
//                          Row(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 4,
//                                box2: 6,
//                                box3: 7,
//                                textBox1: "OP: ",
//                                textBox2: "${o.op.op}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 4,
//                                box2: 6,
//                                box3: 7,
//                                textBox1: "Quant: ",
//                                textBox2: "${o.op.quant}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Column(
//                                children: <Widget>[
//                                  Sizedboxw2Widget(
//                                    controller: controllerGeral,
//                                    box1: 4,
//                                    box2: 5,
//                                    box3: 23,
//                                    textBox1: "Cliente: ",
//                                    textBox2:
//                                        "${o.op.cliente.length >= 25 ? o.op.cliente.substring(0, 25) : o.op.cliente}",
//                                  ),
//                                  Row(
//                                    children: <Widget>[
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 7,
//                                        textBox1: "Orçamento: ",
//                                        textBox2: "${o.op.orcamento}",
//                                      ),
//                                      VerticaldividerWidget(
//                                        controller: controllerGeral,
//                                        size: 3,
//                                      ),
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 8,
//                                        textBox1: "Vendedor: ",
//                                        textBox2:
//                                            "${o.op.vendedor.length >= 10 ? o.op.vendedor.substring(0, 10) : o.op.vendedor}",
//                                      ),
//                                      VerticaldividerWidget(
//                                        controller: controllerGeral,
//                                        size: 3,
//                                      ),
//                                      Sizedboxw2Widget(
//                                        controller: controllerGeral,
//                                        box1: 4,
//                                        box2: 5,
//                                        box3: 8,
//                                        textBox1: "Entrada: ",
//                                        textBox2:
//                                            "${formatDate(DateTime(int.parse("${o.op.entrada.substring(0, 4)}"), int.parse("${o.op.entrada.substring(6, 7)}"), int.parse("${o.op.entrada.substring(9, 10)}")), [
//                                          dd,
//                                          "/",
//                                          mm,
//                                          "/",
//                                          yy
//                                        ])}",
//                                      ),
//                                    ],
//                                  ),
//                                ],
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 4,
//                                box2: 6,
//                                box3: 10,
//                                textBox1: "Prev. Entrega: ",
//                                textBox2:
//                                    "${formatDate(DateTime(int.parse("${o.prevEntrega.substring(0, 4)}"), int.parse("${o.prevEntrega.substring(6, 7)}"), int.parse("${o.prevEntrega.substring(9, 10)}")), [
//                                  dd,
//                                  "/",
//                                  mm,
//                                  "/",
//                                  yy
//                                ])}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Sizedboxw2Widget(
//                                controller: controllerGeral,
//                                box1: 4,
//                                box2: 6,
//                                box3: 20,
//                                textBox1: "Posição:",
//                                textBox2: "${o.status.posicao}",
//                              ),
//                              VerticaldividerWidget(
//                                controller: controllerGeral,
//                                size: 7,
//                              ),
//                              Container(
//                                child: ButtonBarTheme(
//                                  data: ButtonBarTheme.of(context),
//                                  child: ButtonBar(
//                                    alignment: MainAxisAlignment.end,
//                                    children: <Widget>[
//                                      SizedBox(
//                                        child: IconButton(
//                                          iconSize: 25,
//                                          icon: Icon(Icons.check),
//                                          onPressed: () {},
//                                        ),
//                                        height: 40,
//                                        width: 40,
//                                      ),
//                                      SizedBox(
//                                        child: IconButton(
//                                          iconSize: 25,
//                                          icon: Icon(Icons.cancel),
//                                          onPressed: () {},
//                                        ),
//                                        height: 40,
//                                        width: 45,
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                          HorizontaldividerWidget(
//                            controller: controllerGeral,
//                          ),
//                          Sizedboxw2Widget(
//                            controller: controllerGeral,
//                            box1: 4,
//                            box2: 5,
//                            box3: 100,
//                            textBox1: "Serviço: ",
//                            textBox2:
//                                "${o.op.servico.length >= 150 ? o.op.servico.substring(0, 150) : o.op.servico}",
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          );
//        },
//      ),
//    );
//  }
}
