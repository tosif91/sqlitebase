import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlitebase/locator.dart';
import 'package:sqlitebase/services/authentication.dart';
import 'package:googleapis/drive/v3.dart' as ga;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:sqlitebase/services/google_http_client.dart';

class MyDrive{
  GoogleSignInAccount _googleSignInAccount;
final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive.appdata']);


  uploadFileToGoogleDrive() async {  
   // if(_googleSignInAccount != null)  
    _googleSignInAccount=await _googleSignIn.signInSilently();
    
  //   final String dir = (await getApplicationDocumentsDirectory()).path + '/customers.csv';
  //  var client = GoogleHttpClient(await _googleSignInAccount.authHeaders ); 
  //  var drive = ga.DriveApi(client);  
  //  ga.File fileToUpload = ga.File();   
  //  File file=File(dir);
  //  fileToUpload.parents = ["appDataFolder"];  
  //  fileToUpload.name = path.basename(dir);  
  //  var response = await drive.files.create(  
  //    fileToUpload,  
  //    uploadMedia: ga.Media(file.openRead(), file.lengthSync()),  
  //  );  
  await _listGoogleDriveFiles();
  await _downloadGoogleDriveFile('customers.csv','1Oimzllg2co2PJ_LSMCT-WLCismr1cypWlKNOkCnzGMUeSj0icA');
 }  
 Future<void> _listGoogleDriveFiles() async {  
   var client = GoogleHttpClient(await _googleSignInAccount.authHeaders);  
   var drive = ga.DriveApi(client);  
   drive.files.list(spaces: 'appDataFolder').then((value) {  
    
     for (var i = 0; i < value.files.length; i++) {  
       print("Id: ${value.files[i].id} File Name:${value.files[i].name}");  
     }  
   });  
 }  
 Future<void> _downloadGoogleDriveFile(String fName, String gdID) async {  
   var client = GoogleHttpClient(await _googleSignInAccount.authHeaders);  
   var drive = ga.DriveApi(client);  
   ga.Media file = await drive.files  
       .get(gdID, downloadOptions: ga.DownloadOptions.FullMedia);  
   print(file.stream);  
   
   final directory = await getExternalStorageDirectory();  
   print(directory.path);  
   final saveFile = File('${directory.path}/${new DateTime.now().millisecondsSinceEpoch}$fName');  
   List<int> dataStore = [];  
   file.stream.listen((data) {  
     print("DataReceived: ${data.length}");  
     dataStore.insertAll(dataStore.length, data);  
   }, onDone: () {  
     print("Task Done");  
     saveFile.writeAsBytes(dataStore);  
     print("File saved at ${saveFile.path}");  
   }, onError: (error) {  
     print("Some Error");  
   });  
 }  
}