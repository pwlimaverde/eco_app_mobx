import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../app_module.dart';
import 'loginbutton_controller.dart';
import 'widgets/rowlogin/rowlogin_widget.dart';
import 'widgets/rowlogout/rowlogout_widget.dart';

class LoginbuttonWidget extends StatefulWidget {
  @override
  _LoginbuttonWidgetState createState() => _LoginbuttonWidgetState();
}

class _LoginbuttonWidgetState extends State<LoginbuttonWidget> {
    final controller = AppModule.to.bloc<LoginbuttonController>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("condição 1 - tem erro");
            return RowloginWidget();
          }
          if (!snapshot.hasData) {
            print("condição 2 - não tem dados");
            return RowloginWidget();
          }
          print("condição 3 - tem dados");
          return _getOkC(context);
        });
  }

    _getOkC(context) {
        return Observer(
            builder: (_) {
                var user = controller.logado;
                if (user != "sem login") {
                    print("condição ok - stream tem data");
                    return RowlogoutWidget(user);
                }
                print("condição errada - stream sem data");
                return RowloginWidget();
            }
        );
    }
}