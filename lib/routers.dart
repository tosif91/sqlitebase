
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlitebase/utils/routes.dart';
import 'package:sqlitebase/view/entry/entry.dart';
import 'package:sqlitebase/view/home/home.dart';
import 'package:sqlitebase/view/login/login.dart';

class Routers{

static Route<dynamic> toGenerateRoute(RouteSettings settings){
  switch(settings.name){
    case home:
    return MaterialPageRoute(builder: (context)=>Home());
    case login:
    return MaterialPageRoute(builder: (context)=>Login());
    case entry:
    return MaterialPageRoute(builder: (context)=>Entry());
    // return MaterialPageRoute(builder: (context)=>SignUp());
    // case onboarding:
    // return MaterialPageRoute(builder: (context)=>Onboarding());
    // case chat_history_screen:
    // return MaterialPageRoute(builder: (context)=>ChatHistoryView());
    // case splash_screen:
    // return MaterialPageRoute(builder: (context)=>SplashView());
    
    
    default:
    return MaterialPageRoute(builder: (context)=>Container(
      alignment: Alignment.center,
      child:Text('Invalid Route'),
      ));
    }//switch
  }
}
