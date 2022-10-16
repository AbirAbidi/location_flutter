

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/widgets/post_widget_with_delete.dart';

import '../widgets/post_widget.dart';
import 'home_page.dart';
dynamic uid = FirebaseAuth.instance.currentUser!.uid;
class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Padding(
          padding: const EdgeInsets.only(left: 15,top: 20),
          child: Row(children: [
              InkWell(
                    onTap: () {
                       Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10) ,
                      border: Border.all(
                        color:  Colors.grey.shade300,
                        width: 1,
                      )),
                    child:const  Icon(Icons.arrow_back,color:  Color.fromRGBO(30, 49, 157, 100) ,),
                            ),
                  ),
                  const SizedBox(width: 20,),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
                    builder: (context, snapshot) {
                     
                     if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }else 
                     
                      if (snapshot.hasData) {
                         return ClipOval(
                        child: SizedBox.fromSize(
                          size:const  Size.fromRadius(40),
                          child: Image.network(      
                            snapshot.data!["urlAvatar"],
                            ),
                        ),
                      );
                      }return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
                     
                    }
                  ),
                  const SizedBox(width: 10,),
                  const Text('Favorites',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
            ],),
        ),
          const SizedBox(height: 20,),
         // const PostWidgetWithDelete()
        ],
      )),
    );
  }
}