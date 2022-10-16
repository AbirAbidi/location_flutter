// ignore_for_file: unused_element

import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class AuthServives {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  EndUser _userFirebaseUser(User? firebaseUser,String location , String phone,String username,String urlAvatar) {
    return EndUser(
      uid: firebaseUser!.uid,
      email: _auth.currentUser!.email!,
      location: location,
      username: username,
      phone:phone ,
      urlAvatar: urlAvatar,
      );
  }

  Future loginUser(String email, String password) async {
    try {
     UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
   //  User firebaseUser = endUserCredentials.user!;
  //    return _userFirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user login failed :: $err');
      log('user login failed :: $stacktrace');
      return null;
    }
  }

  Future registerUser(EndUser newUser, String password) async {
    try {
      UserCredential endUserCredentials =
          await _auth.createUserWithEmailAndPassword(
              email: newUser.email, password: password);
      User firebaseUser = endUserCredentials.user!;
      fromDocToAuth(newUser, firebaseUser.uid);
     // return _userFirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user signup failed :: $err');
      log('user signup failed :: $stacktrace');
      return null;
    }
  }

  Future fromDocToAuth( EndUser newUser, String? uid, ) async {
     FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(newUser.toJson());
  }

  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future checkLogInOrLogOut() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
        print(user.email);
      }
    });
  }

// delete from auth but not from firestore
  Future deleteAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();

      await FirebaseFirestore.instance.collection('users').doc().delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        log('The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  Future updateUserData(String username , String phone,String location,String urlAvatar,String uid)async{
     await _firebaseFirestore.collection('users').doc(uid).update({
      "username" : username,
      "phone" : phone,
      "location": location ,
      "urlAvatar":urlAvatar
    });
  }




   Future updateUserUsername(String username , String uid)async{
     await _firebaseFirestore.collection('users').doc(uid).update({
      "username" : username,
    });
  }
  Future updateUserPhone(String phone , String uid)async{
     await _firebaseFirestore.collection('users').doc(uid).update({
      "phone" : phone,
    });
  }
    Future updateUserLocation(String location , String uid)async{
     await _firebaseFirestore.collection('users').doc(uid).update({
      "location" : location,
    });
  }
 Future updateUserUrlAvatar(String urlAvatar , String uid)async{
     await _firebaseFirestore.collection('users').doc(uid).update({
      "urlAvatar" : urlAvatar,
    });
  }

  












////// new  methods 
Future signIn(String email ,String password)async{
    try {  
 UserCredential endUserCredentials = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
          User firebaseUser = endUserCredentials.user!;
         // return _userFirebaseUser(firebaseUser);
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  



  
}

  
Future<DocumentSnapshot> getUserData (String uid)async{
    return _firebaseFirestore.collection('users').doc(uid).get();
  }


















}