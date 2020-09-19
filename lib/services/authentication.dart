import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication{

//  GoogleSignInAccount _googleSignInAccount;
final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/drive.appdata']);
final FirebaseAuth _auth= FirebaseAuth.instance;

//bool isUserSignedIn = false;

bool ifUser(){
 return (_auth.currentUser != null)?true:false;
}

Future<User>handleSignIn()async=>await _handleSignIn();

Future<User> _handleSignIn() async {
   // hold the instance of the authenticated user
   User user;
   // flag to check whether we're signed in already
   bool isSignedIn = await _googleSignIn.isSignedIn();
  //  setState(() {
  //     isUserSignedIn = userSignedIn;
  //  });
   if (isSignedIn) {
      // if so, return the current user
      user = _auth.currentUser;
   }
   else {
      final GoogleSignInAccount googleUser = 
         await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = 
         await googleUser.authentication;
      // get the credentials to (access / id token)
      // to sign in via Firebase Authentication 
      final AuthCredential credential =
         GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken
         );
      user = (await _auth.signInWithCredential(credential)).user;
     
    //check if success
  

   }
 
   return user;
}


}