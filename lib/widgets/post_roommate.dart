import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/details_post_shared_by_others_to_find_roommate.dart';
import 'package:location_flutter/pages/text_roommate_post.dart';
import 'package:location_flutter/pages/usercred.dart';
import 'package:location_flutter/services/post_services.dart';
import 'package:animations/animations.dart';
import '../pages/home_page.dart';
import '../pages/profile.dart';

class RoommateWidget extends StatelessWidget {
  final String info;
  final String uid;
  final String location;
  const RoommateWidget({Key? key, required this.info, required this.uid, required this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('Roommate').doc().snapshots(),
      builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              width: 380,
              height: 80,
            
               decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 26, 175),
                                   borderRadius: BorderRadius.circular(15) ,
                          ),
                          child: StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                  return Center(child: Column(children:const  [
                                    Icon(Icons.error,size: 30,color: Colors.red,),
                                    Text('Something went wrong ! ',style: TextStyle(color: Colors.red),)
                                  ],),);
                               }else
                               if (snapshot.connectionState == ConnectionState.waiting){
                                  return const  Center(child: CircularProgressIndicator(),);
                               }else
                               
                                        
                                          
                              if (snapshot.hasData) {
                                return OpenContainer(
                                  //openShape: const RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(15))),
                                 closedShape:const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    ), 
                                  closedColor: const Color.fromARGB(255, 0, 26, 175),
                                  openBuilder: ((context, _) => DetailsPostRoommate(urlAvatar:snapshot.data!["urlAvatar"],details: info,name: snapshot.data!["username"],)),
                                  closedBuilder : ((context, _) => 
                                   Row(
                                                                 // alignment: Alignment.center,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Row(children: [ClipOval(
                                                    child: SizedBox.fromSize(
                                                      size:const  Size.fromRadius(26),
                                                      child:  Image.network(      
                                    snapshot.data!["urlAvatar"],
                                    )
                                                                
                                                    
                                                    ),
                                                  ),],),
                                  ),
                                                                 const SizedBox(width: 15,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text('${snapshot.data!["username"]}',style:const  TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w400)),
                                       Text(location,style: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w300))
                                    ],),
                                  )
                                                                ],))
                                );
                              } return Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: children,
                                          ),
                                        );
                              
                            }
                          ),
            ),
            const SizedBox(height: 30,)
          ],
        );
      }
    );
  }
}