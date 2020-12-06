import 'package:classroom/models/userID.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(User user) {
    return user != null ? user : null;
  }


  Future <User> signInEmailAndPass(String email, String password) async {
    try{
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }
  Future <User> signUpWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = authResult.user;
      print(firebaseUser.uid);
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}