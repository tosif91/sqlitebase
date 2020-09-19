import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/routers.dart';
import 'package:sqlitebase/services/db.dart';
import 'package:sqlitebase/view/entry/entry.dart';
import 'package:sqlitebase/view/home/home.dart';
import 'package:sqlitebase/view/splash/splash.dart';
import 'package:stacked_services/stacked_services.dart';
void main() async{
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await locator<DB>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Splash(),
navigatorKey: locator<NavigationService>().navigatorKey,
onGenerateRoute: Routers.toGenerateRoute,
      
      );
  }
}
