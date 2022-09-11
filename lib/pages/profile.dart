

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/user.dart';
import 'package:location_flutter/pages/add_post.dart';
import 'package:location_flutter/pages/sign_in.dart';
import 'package:location_flutter/pages/update_profile.dart';
import 'package:location_flutter/services/auth.dart';

import 'home_page.dart';
final user = FirebaseAuth.instance.currentUser;
String userUid = user!.uid;
String? userEmail = user!.email;
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: FutureBuilder<DocumentSnapshot>(
        future: AuthServives().getUserData(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapshot) {
          return Column(
                children: [
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 26, 175),
                                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)) ,
                           ),
                            child: Stack(
                              children: [Padding(
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
                              color:  Colors.white,
                              width: 1,
                              )),
                              child:const  Icon(Icons.arrow_back,color:  Colors.white ,),
                                  ),
                                ),
                              ),
                                //  const SizedBox(height: 10,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 145,top: 40),
                                 child: Container(
                                  decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(5, 3), // changes position of shadow
                                  ),
                              ],

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(64) ,
                              ),
                                  child: ClipOval(
                              child: SizedBox.fromSize(
                                  size:const  Size.fromRadius(64),
                                  child: Image.network(
                                  '${snapshot.data!["urlAvatar"]}',
                                  ),
                              ),
                                            ),
                              ),
                               ),
                              const SizedBox(height: 16,),
                              Positioned(
                                top: 180,
                                left: 158,
                                child: Row(children: [
                                    InkWell(
                                onTap: () {
                                  AuthServives().logOut().then((value) => Navigator.push(context,
                          (CupertinoPageRoute(builder: (context) => const SignIN()))));
                                },
                                child: Container(
                                height: 40,
                                width: 40,
                                    decoration: BoxDecoration(
                                    //  color: Colors.red,
                                       borderRadius: BorderRadius.circular(10) ,
                                border: Border.all(
                                color:  Colors.white,
                                width: 1,
                                )),
                                child:const  Icon(Icons.logout,color:  Colors.white ,),
                                    ),
                                  ),
                                  const SizedBox(width: 20,),
                                    InkWell(
                                onTap: () {
                                  AuthServives().deleteAccount();
                                },
                                child: Container(
                                height: 40,
                                width: 40,
                                    decoration: BoxDecoration(
                                    //  color: Colors.red,
                                       borderRadius: BorderRadius.circular(10) ,
                                border: Border.all(
                                color:  Colors.white,
                                width: 1,
                                )),
                                child:const  Icon(Icons.delete,color:  Colors.white ,),
                                    ),
                                  ),
                                ],),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left: 120,top: 240),
                                child: Center(child: Text(snapshot.data!["email"],style:const  TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),)),

                              ),]
                            ),
                  ),
                  const SizedBox(height: 30,),
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
                    const SizedBox(height: 130,),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Column ( children : [
                      InkWell(
                        onTap: (() {
                           Navigator.push(context, CupertinoPageRoute(builder: (context)=> const AddPost()));

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
                                    child: Text('Add a Post ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 19,color: Colors.white))
                                  ),
                        ),
                      ),
                      const SizedBox(height: 25,),
                      InkWell(
                        onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context)=> const UpdateProfile()));

                        },
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
                      ),]),
                    )
                    ],),
                  )

                ],
              );
        }
      )
    ));
          }
            
        }
     