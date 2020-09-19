import 'package:sqlitebase/services/authentication.dart';
import 'package:sqlitebase/services/db.dart';
import 'package:sqlitebase/services/my_drive.dart';
import 'package:sqlitebase/view/entry/entry_model.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.instance;

setUpLocator(){
  //stacked service..
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());

//services
  locator.registerLazySingleton(() => Authentication());
  locator.registerLazySingleton(() => DB());
  locator.registerLazySingleton(() => MyDrive());

  locator.registerLazySingleton(() => EntryModel());

 
}
