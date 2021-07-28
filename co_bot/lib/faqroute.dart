import 'package:flutter/cupertino.dart';
import 'package:co_bot/screens/faq.dart';


class FAQroute extends PageRouteBuilder
{
    final Widget widget;
    FAQroute({this.widget})
    :super
    (
    transitionDuration: Duration(seconds: 3),
      transitionsBuilder: (BuildContext context,Animation<double> animation ,Animation<double> secanimation,Widget child)
      {
        animation= CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return ScaleTransition(alignment:Alignment.center,scale:animation,child: child,);
      },
      pageBuilder: (BuildContext context,Animation<double> animation ,Animation<double> secanimation) 
      {
        return FAQ();
      },
    );
}