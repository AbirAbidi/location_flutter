import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/services/auth.dart';

class MessageWidget extends StatefulWidget {
  const MessageWidget({Key? key}) : super(key: key);

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: AuthServives().getUserData(FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: 380,
              height: 80,
              
               decoration: BoxDecoration(
                color:const  Color.fromRGBO(30, 49, 157, 100),
                                   borderRadius: BorderRadius.circular(15) ,
                          ),
                          child: Row(
                            children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(children: [ClipOval(child: SizedBox.fromSize(
                                size:const  Size.fromRadius(26),
                                child: Image.network(snapshot.data!['url avatar'])))],),
                            ),
                           const SizedBox(width: 15,),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                Text(snapshot.data!["username"],style:const  TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w400)),
                                 StreamBuilder<DocumentSnapshot>(
                                   stream: FirebaseFirestore.instance.collection('Posts').doc().snapshots(),
                                   builder: (context, snapshot) {
                                     return Text(snapshot.data!['info'],style:const  TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w400));
                                   }
                                 )
                              ],),
                            )
                          ],),
            ),
            const SizedBox(height: 30,)
          ],
        );
      }
    );
  }
}