import 'package:flutter/material.dart';

class Sizedboxl2Widget extends StatelessWidget {

  var controller;
  int box1;
  String textBox1;
  int line;

  Sizedboxl2Widget({this.controller ,this.box1, this.textBox1, this.line});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.getQuery(context, box1),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(textBox1,
            maxLines: line ?? 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold)),
      ),
    );
  }

//  _SizedBox(BuildContext context) {
//    if(textBox2.length >= 7){
//      if(textBox2.length >= 150){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.1),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 120){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.2),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 90){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.3),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 70){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.6),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 30){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.8),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 15){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/2),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      if(textBox2.length >= 8){
//        return SizedBox(
//          width: controller.getQueryW(context, box2/1.4),
//          child: FittedBox(
//            fit: BoxFit.fitWidth,
//            child: Text(textBox2,
//                maxLines: line ?? 1,
//                overflow: TextOverflow.ellipsis,
//                style: TextStyle(
//                    fontWeight: FontWeight.bold)),
//          ),
//        );
//      }
//      return SizedBox(
//        width: controller.getQueryW(context, box2/2.2),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    if(textBox2.length >= 6){
//      return SizedBox(
//        width: controller.getQueryW(context, box2/1.1),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    if(textBox2.length >= 5){
//      return SizedBox(
//        width: controller.getQueryW(context, box2/1.1),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    if(textBox2.length >= 4){
//      return SizedBox(
//        width: controller.getQueryW(context, box2/1.2),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    if(textBox2.length >= 3){
//      return SizedBox(
//        width: controller.getQueryW(context, box2/1.4),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    if(textBox2.length >= 2){
//      return SizedBox(
//        width: controller.getQueryW(context, box2/1.9),
//        child: FittedBox(
//          fit: BoxFit.fitWidth,
//          child: Text(textBox2,
//              maxLines: line ?? 1,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(
//                  fontWeight: FontWeight.bold)),
//        ),
//      );
//    }
//    return SizedBox(
//      width: controller.getQueryW(context, box2/2),
//      child: FittedBox(
//        fit: BoxFit.fitWidth,
//        child: Text(textBox2,
//            maxLines: line ?? 1,
//            overflow: TextOverflow.ellipsis,
//            style: TextStyle(
//                fontWeight: FontWeight.bold)),
//      ),
//    );
//  }
}
