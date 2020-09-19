import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/services/authentication.dart';
import 'package:sqlitebase/utils/routes.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginModel extends BaseViewModel{
Authentication _authentication=locator<Authentication>();
NavigationService _navigationService=locator<NavigationService>();
DialogService _dialogService=locator<DialogService>();
signIn()async{
  setBusy(true);
  var user=await _authentication.handleSignIn();
if(user != null)
{

 setBusy(false);
 _navigationService.pushNamedAndRemoveUntil(home);
}
else{
_dialogService.showDialog(title:'signIn again',description: 'something went wrong');
}

}

}