import 'package:eco_app_mobx/app/shared/global/loginbutton/loginbutton_controller.dart';
import 'package:eco_app_mobx/app/shared/global/menudrawer/widgets/dropdownbutton/dropdownbutton_widget.dart';
import 'package:eco_app_mobx/app/shared/global/menudrawer/widgets/tilelist/tilelist_widget.dart';
import 'package:eco_app_mobx/app/shared/global/menudrawer/widgets/useraccount/useraccount_widget.dart';
import 'package:eco_app_mobx/app/shared/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import '../../../../../app_module.dart';

class DrawerlistWidget extends StatelessWidget {
  final store = AppModule.to.bloc<LoginbuttonController>();
//  var _currence = ["modulo", "item 1", "Item 2"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _estaLogado(context),
        TilelistWidget(
          "Modulo de Pedidos",
          "Listagem de OPS",
          iconLead: Icon(Icons.watch_later),
          iconTrai: Icon(Icons.arrow_forward),
          onTap: () {
            if(store.logado != "sem login"){
              Navigator.pop(context);
              return print("teste on tap");
            }
            Navigator.pop(context);
            _navLoginPage(context);
          },
        ),
        TilelistWidget(
          "Modulo de Orçameto Flexo",
          "Filme e Adesivo",
          iconLead: Icon(Icons.monetization_on),
          iconTrai: Icon(Icons.arrow_forward),
          onTap: () {
            if(store.logado != "sem login"){
              Navigator.pop(context);
              return print("teste on tap");
            }
            Navigator.pop(context);
            _navLoginPage(context);
          },
        ),
      ],
    );
  }

  _estaLogado(context) {
    if (store.logado != "sem login") {
      return UseraccountWidget(
        store.logado,
        "Sistema Ecoprint",
        "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png",
      );
    }
    return InkWell(
      child: UseraccountWidget(
        "Usuario não Logado",
        "Faça o login para ter acesso ao sistema",
        "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-3-512.png",
      ),
      onTap: () {
        Navigator.pop(context);
        _navLoginPage(context);
      },
    );
  }
  _navLoginPage(BuildContext context, {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginModule()),
      );
    }
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginModule()),
    );
  }
}


