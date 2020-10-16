import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:Nivid/providers/student.dart';
import 'package:Nivid/screens/decider_screen.dart';
import 'package:Nivid/global/default_dialog_box.dart';
import 'package:Nivid/screens/bottom_tabs_screen.dart';
import 'package:Nivid/helpers/custome_slide_route.dart';

class Authentication {
  static Future<void> googleSignin(BuildContext context) async {
    try {
      DefaultDialogBox.loadingDialog(context, title: 'Please wait...');
      final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email', 'profile'], clientId: '', hostedDomain: '');
      final GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
      if (_googleAccount.email.endsWith('@iiitkottayam.ac.in')) {
        final GoogleSignInAuthentication googleAuthentication =
            await _googleAccount.authentication;
        final GoogleAuthCredential _googleCredential =
            GoogleAuthProvider.credential(
                idToken: googleAuthentication.idToken,
                accessToken: googleAuthentication.accessToken);
        final UserCredential _userCredential =
            await FirebaseAuth.instance.signInWithCredential(_googleCredential);
        final _firebaseUser = _userCredential.user;
        final student = Student(
            id: _firebaseUser.uid,
            name:
                _googleAccount.displayName ?? _firebaseUser.email.split('@')[0],
            email: _firebaseUser.email,
            startDate: null,
            profileImageLink: _googleAccount.photoUrl);
        await FirebaseFirestore.instance
            .collection('students')
            .doc(_firebaseUser.uid)
            .set(student.toJson()..['sd'] = FieldValue.serverTimestamp(),
                SetOptions(merge: true));
        await _googleSignIn.signOut();
        Navigator.of(context).pushAndRemoveUntil(
            CustomSlideRoute(BottomTabsScreen(), begin: Offset(1.0, 0)),
            (route) => false);
        Fluttertoast.showToast(
            msg: 'Successfully logged in!',
            backgroundColor: Colors.grey[800],
            textColor: Colors.white);
      } else {
        await _googleSignIn.signOut();
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg:
                'Your college is not yet registered!\nPlease contact your college administrator.',
            backgroundColor: Colors.grey[800],
            textColor: Colors.white);
      }
    } on PlatformException catch (error) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'ERROR : ' + error.message,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    } catch (error) {
      print(error);
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'Something went wrong!',
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    }
  }

  static Future<void> logout(BuildContext context) async {
    try {
      DefaultDialogBox.loadingDialog(context, title: 'Please wait...');
      await FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      Navigator.of(context).pushAndRemoveUntil(
          CustomSlideRoute(DeciderScreen(), begin: Offset(0.0, -1.0)),
          (route) => false);
      Fluttertoast.showToast(
          msg: 'Successfully logged out!',
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    } on PlatformException catch (error) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'ERROR : ' + error.message,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    } catch (error) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: 'Something went wrong!',
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    }
  }
}
