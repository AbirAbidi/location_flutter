 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter/src/foundation/key.dart';
 import 'package:flutter/src/widgets/framework.dart';
 import 'package:location_flutter/models/house.dart';
 import 'package:location_flutter/pages/post_info_page.dart';
import 'package:location_flutter/services/post_services.dart';
 FirebaseAuth _auth = FirebaseAuth.instance;
 FirebaseFirestore _firestore = FirebaseFirestore.instance;
 // final EndHouse newHouse = EndHouse(details: details, uid: uid, phone: phone, location: location, gouvernate: gouvernate, price: price, image: image)
 bool _isRed = false;




 class PostWidget extends StatelessWidget {
   const PostWidget({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('Posts').doc().snapshots(),
      builder: (context, snapshot) {
        return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Stack(
              alignment: Alignment.topLeft,
               children: [InkWell(
                  onTap :(){  Navigator.push(context, CupertinoPageRoute(builder: (context)=> const PostInfoPage()));}
                 ,child: Container(
                   width: 360,
                   height: 210,
                   decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade400
                     ),
                    color: Colors.grey.shade100 ,
                      borderRadius: BorderRadius.circular(10) ,
                    boxShadow: [
                                 BoxShadow(
                                     color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 2,
                                     blurRadius: 6,
                                    offset: const Offset(0, 3), // changes position of shadow
                              ),
                           ],
                   ),
                ),
               ),



                Padding(
                    padding: const EdgeInsets.only(top:15,left: 15),
                     child: Container(
                         width: 120,
                        height: 40,
                         decoration: BoxDecoration(
                           color: Colors.white ,
                            borderRadius: BorderRadius.circular(6) ,
                         ),
                         child: Image.network(snapshot.data!["image"])
                         ),
                   ),
 Padding(
   padding: const EdgeInsets.only(top:25,left: 27),
   child:   Row(

                         children:  [

                           Text('\$${snapshot.data!["price"]}',style:const  TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),

                         const   Text('/month',style:TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300))

                         ]

                       ),
 )


               ]

                   ),
                   Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                      const  SizedBox(height: 20,),
                       Text(snapshot.data!["location"],style:const  TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w500),),
                       const SizedBox(height: 5,),
                       Text(snapshot.data!["governorate"],style:const  TextStyle(fontSize: 16,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w400),)
                         ]),
                         const SizedBox(width: 220,),
                        Column(
                          children:  [
                             const SizedBox(height: 24,),
                            InkWell(
                               onTap: () {
                                 _isRed = !_isRed;
                               },
                               child: Icon(CupertinoIcons.heart_solid,color:_isRed ? Colors.red : Colors.white,size: 33,)),
                           ],
                         )
                     ],
                   ),
                   const SizedBox(height: 30,)
           ],
         );
      }
    );
   }
 }