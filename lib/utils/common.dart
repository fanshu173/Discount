import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonUtil {
  static Future? push(BuildContext context, Widget widget) {
    Future result = Navigator.push(
        context,
//        PageRouteBuilder(
//          transitionDuration: Duration(milliseconds: 500),
//          pageBuilder: (BuildContext context, Animation animation,
//              Animation secondaryAnimatioZn) {
//            return new FadeTransition(
//              //使用渐隐渐入过渡,
//              opacity: animation,
//              child: widget, //路由B
//            );
//          },
//        ));
        // 使用ios的转场动画
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }



}


