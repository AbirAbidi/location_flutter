

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
import 'package:location_flutter/pages/user_info.dart';
import 'home_page.dart';
final user = FirebaseAuth.instance.currentUser;
String userUid = user!.uid;
String? userEmail = user!.email;
List<Widget> children = [];
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child:Column(
                children: [
                  FutureBuilder<DocumentSnapshot>(
                    future: AuthServives().getUserData(FirebaseAuth.instance.currentUser!.uid),
                    builder: (context, snapshot) {
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
                }else
                      if (snapshot.hasError) {
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
                      if (snapshot.hasData) {
                        return Container(
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
                                     padding: const EdgeInsets.only(top: 180),
                                     child: Center(child: Text(snapshot.data!["email"],style:const  TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.white),)),
                                   ),]
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
                  const SizedBox(height: 30,),
                  const Divider( color:Colors.black,),
                        InkWell(
                          onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>const UserInfo1()));
                          },
                          child: Row(children: const [
                            Icon(Icons.settings),
                             SizedBox(width: 10,),
                            Text('Settings')
                          ],),
                        ),
                        const Divider( color:Colors.black,),
                        InkWell(
                          onTap: () {
                          //  Navigator.push(context,MaterialPageRoute(builder: (context)=> const ) );
                          },
                          child: Row(children: const [
                            Icon(Icons.post_add),
                             SizedBox(width: 10,),
                            Text('Shared posts')
                          ],),
                        ),
                        const Divider( color:Colors.black,),
                        Row(children: const [
                          Icon(Icons.help),
                           SizedBox(width: 10,),
                          Text('Help')
                        ],),

                ],
              )
          
                    
          
        
      
    ));
          }
            
        }
     