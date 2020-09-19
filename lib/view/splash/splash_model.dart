import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/services/authentication.dart';
import 'package:sqlitebase/utils/routes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashModel extends BaseViewModel{
  NavigationService _navigationService=locator<NavigationService>();
Authentication _authentication=locator<Authentication>();
  checkState(){
 if( _authentication.ifUser()){
   print('home pushed');
  _navigationService.pushNamedAndRemoveUntil(home);
 }
 else{
   print('login pushed');
_navigationService.pushNamedAndRemoveUntil(login);
 }

  }
}