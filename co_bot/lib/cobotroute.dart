import 'package:flutter/cupertino.dart';
import 'package:co_bot/screens/chat.dart';

class Cobotroute extends PageRouteBuilder
{
    final Widget widget;
    Cobotroute({this.widget})
    :super
    (
      transitionDuration: Duration(seconds: 3),
      pageBuilder: (context, animation, secondaryAnimation){return Chat();},
      transitionsBuilder: (context, animation, secondaryAnimation, child)
      {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      } 

    );


}