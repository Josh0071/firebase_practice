import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

late String name;
late String email;
late String imageUrl;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
  await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  name = user!.displayName!;
  email = user.email!;
  imageUrl = user.photoURL!;

  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  final User? currentUser = _auth.currentUser;

  print('signInWithGoogle succeeded: $user');

  return '$user';
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out") ;
}
