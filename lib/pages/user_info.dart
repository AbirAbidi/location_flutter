import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/add_post.dart';
import 'package:location_flutter/pages/update_profile.dart';

import '../services/auth.dart';
import '../widgets/post_widget.dart';

class UserInfo1 extends StatefulWidget {
  const UserInfo1({super.key});

  @override
  State<UserInfo1> createState() => _UserInfo1State();
}

class _UserInfo1State extends State<UserInfo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom:8.0),
        child: InkWell(
                          onTap: (() {
                             Navigator.push(context, CupertinoPageRoute(builder: (context)=> const UpdateProfile()));

                          }),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 6,
                                          offset: const Offset(5, 3), // changes position of shadow
                                    ),
                                ],
                                      color: const Color.fromARGB(255, 0, 26, 175),
                                               borderRadius:  BorderRadius.circular(40) ,
                        ),
                                    child: const Center(
                                      child: Text('Update Profile ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,color: Colors.white))
                                    ),
                          ),
                        ),
      ),
      body: SafeArea(child: Column(
        children: [
            FutureBuilder<DocumentSnapshot>(
              future: AuthServives().getUserData(FirebaseAuth.instance.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                                        padding: const EdgeInsets.only(left: 15,top: 10),
                                        child: InkWell(
                                      onTap: () {
                                      Navigator.pop(context);
                                      },
                                      child: Container(
                                      height: 40,
                                      width: 40,
                                          decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10) ,
                                      border: Border.all(
                                      color:  Colors.grey,
                                      width: 1,
                                      )),
                                      child:const  Icon(Icons.arrow_back,color:  Color.fromARGB(255, 0, 26, 175) ,),
                                          ),
                                        ),),
                        ],
                      ),
                                    const SizedBox(height: 50,),
                      Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
            
                             Text('User info :',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.grey.shade800)),
                            const SizedBox(height: 13,),
                            Row(children:  [
                              const Text('Username: ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17)),
                              const SizedBox(width: 4,),
                              Text(snapshot.data!["username"],style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 17))
                            ],),
                            const SizedBox(height: 20,),
                            Row(children:  [
                            const   Text('Phone Number: ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17)),
                             const  SizedBox(width: 4,),
                              Text(snapshot.data!["phone"],style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 17))
                            ],),
                            const SizedBox(height: 20,),
                            Row(children:  [
                             const  Text('Current location: ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 17)),
                              const SizedBox(width: 4,),
                              Text(snapshot.data!["location"],style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 17))
                            ],),
                           
                          //  const SizedBox(height: 130,),
            
                           
                            ],),
                          ),
                    ],
                  );
                }else
                if(snapshot.hasError){
                  return Column( children :[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ]);
                }else
                if(snapshot.connectionState ==ConnectionState.waiting){
                  Column( children :const [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ]);
                } return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
              }
            )
        ],
      )),
    );
  }
}