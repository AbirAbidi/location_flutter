import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/roommate.dart';
import 'package:location_flutter/pages/home_page.dart';
import 'package:location_flutter/widgets/post_roommate.dart';

import '../services/post_services.dart';
import '../widgets/post_widget.dart';
import 'add_roommate_post.dart';

class FindRoommate extends StatefulWidget {
  const FindRoommate({Key? key}) : super(key: key);

  @override
  State<FindRoommate> createState() => _FindRoommateState();
}

class _FindRoommateState extends State<FindRoommate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left:15,bottom: 20,right: 15 ),
        child: SizedBox(
                      height: 60,
                       child: SizedBox(
                       width: 170,
                       child: InkWell(
                         onTap: () {
                           Navigator.push(context, CupertinoPageRoute(builder: (context) => const AddPostRoommate()));
                         },
                         child: Container(
                         decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 3,
                                blurRadius: 6,
                                offset: const Offset(2, 2), // changes position of shadow
                          ),
                        ],
                             color:const  Color.fromARGB(255, 0, 26, 175),
                             borderRadius: BorderRadius.circular(30) ,
                           ),
                         child:const  Center(child: Text('Add a post to find a roommate',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                            
                         ),
                       ),
                      ),
                     ),
      ),
      body: SafeArea(child: Column(
        children: [

          Row(
            children: [

                InkWell(
                  onTap: () {
                     Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 20),
                    child: Container(
                      height: 40,
                      width: 40,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10) ,
                      border: Border.all(
                        color:  Colors.grey.shade300,
                        width: 1,
                      )),
                    child:const  Icon(Icons.arrow_back,color:  Color.fromARGB(255, 0, 26, 175) ,),
                            ),
                  ),
                ),

            ],
          ),
          const SizedBox(height: 40,),
          //widget
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Roommate').snapshots(),
              builder: ( context,  snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Column(children:const  [
                    Icon(Icons.error,size: 30,color: Colors.red,),
                    Text('Something went wrong ! ',style: TextStyle(color: Colors.red),)
                  ],),);
                }else
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const  Center(child: CircularProgressIndicator(),);
                }
                else {
                  if (snapshot.hasData){
                    return ListView.builder(
                      itemCount:snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                     Roommate r = Roommate(info: snapshot.data!.docs[index]['info'], uid: snapshot.data!.docs[index]['uid'],location:snapshot.data!.docs[index]['location']);
                        return  StreamBuilder<DocumentSnapshot>(
                          stream:  FirebaseFirestore.instance.collection('Roommate').doc().snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError ) {
                                        Column( children :[
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
                                          if(snapshot.hasData){
                                            return RoommateWidget(info: r.info, uid: r.uid,location: r.location,);
                                          }else
                                          if(snapshot.connectionState == ConnectionState.waiting){
                                         
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
                                          }return Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: children,
                                            ),
                                          );
                            
                          }
                        );
                      }
                  );
                  } 
                  return Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: children,
                                            ),
                                          );
                  
                }
              }
          )
          /*Container(
            height: 500,
          ),*/

        ],
      )),
    );
  }
}