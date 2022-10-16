import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location_flutter/models/house.dart';
import 'package:location_flutter/models/roommate.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class PostServices {
Future addPostHouse (EndHouse newHouse)async{
   FirebaseFirestore.instance.collection('Posts').doc().set(newHouse.toJson());
}

Future fromDocToAuth( EndHouse newHouse, ) async {
     FirebaseFirestore.instance
        .collection('Posts')
        .doc()
        .set(newHouse.toJson());
  }



fetchAllPostHouse()async{
  return  _firestore.collection('Posts').snapshots();
}


addPostRoommate (Roommate roommate)async{
  await _firestore.collection('Roommate').doc().set(roommate.toJson());
}

fetchAllPostRoommate()async{
  return  _firestore.collection('Roommate').snapshots();
}


addPostToFav (String PostUid,String uid)async{
  return _firestore.collection('users').doc(uid).collection('fav').doc(PostUid).update({
    "fav":PostUid
}) ;
}

deletePostFromFav (String PostUid ,String uid)async{
  return _firestore.collection('users').doc(uid).collection('fav').doc(PostUid).delete();
}








}


