import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final gooleSignIn = GoogleSignIn();

// a simple sialog to be visible everytime some error occurs
/* showErrDialog(BuildContext context, String err) {
  // to hide the keyboard, if it is still p
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
    context: context,
    builder: AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    ), builder: (BuildContext context) {  },
  );
} */

// many unhandled google error exist
// will push them soon
Future googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await auth.signInWithCredential(credential);

    FirebaseUser user = await auth.currentUser();
    print(user.uid);

    return Future.value(true);
  }
}

// instead of returning true or false
// returning user to directly access UserID
Future signin(
    String email, String password, BuildContext context) async {
  try {
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: email);
    FirebaseUser user = result.user;
    // return Future.value(true);
    return Future.value(user);
  } catch (e) {
   
    return Future.value(null);
  }
}

// change to Future<FirebaseUser> for returning a user
Future signUp(String email, String password, BuildContext context) async {
  try {
    AuthResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: email);
    FirebaseUser user = result.user;
    return Future.value(user);
    // return Future.value(true);
  } catch (error) {}
}

Future signOutUser() async {
  FirebaseUser user = await auth.currentUser();
  print(user.providerData[1].providerId);
  if (user.providerData[1].providerId == 'google.com') {
    await gooleSignIn.disconnect();
  }
  await auth.signOut();
  return Future.value(true);
}
