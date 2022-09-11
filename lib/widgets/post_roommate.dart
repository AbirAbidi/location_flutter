import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/details_post_shared_by_others_to_find_roommate.dart';
import 'package:location_flutter/pages/text_roommate_post.dart';
import 'package:location_flutter/services/post_services.dart';

class PostRoommate extends StatefulWidget {
  const PostRoommate({Key? key}) : super(key: key);

  @override
  State<PostRoommate> createState() => _PostRoommateState();
}

class _PostRoommateState extends State<PostRoommate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('Roommate').doc().snapshots(),
      builder: (context, snapshot) {
        return InkWell(
          onTap: () {
             Navigator.push(context,
                      (CupertinoPageRoute(builder: (context) => const DetailsPostRoommate())));
          },
          child: Column(
            children: [
              Container(
                width: 380,
                height: 80,
                
                 decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 26, 175),
                                     borderRadius: BorderRadius.circular(15) ,
                            ),
                            child: Row(
                             // alignment: Alignment.center,
                              children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(children: [ClipOval(
                        child: SizedBox.fromSize(
                          size:const  Size.fromRadius(26),
                          child: Image.network(      
                            snapshot.data!["image"],
                            ),
                        ),
                      ),],),
                              ),
                             const SizedBox(width: 15,),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(snapshot.data!["username"],style:const  TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w400)),
                              const     Text('Read more ...',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w300))
                                ],),
                              )
                            ],),
              ),
              const SizedBox(height: 30,)
            ],
          ),
        );
      }
    );
    
  }
}