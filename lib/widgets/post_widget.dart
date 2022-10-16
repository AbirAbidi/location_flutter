 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter/src/foundation/key.dart';
 import 'package:flutter/src/widgets/framework.dart';
 import 'package:location_flutter/models/house.dart';
 import 'package:location_flutter/pages/post_info_page.dart';
import 'package:location_flutter/services/post_services.dart';
import 'package:animations/animations.dart';
 FirebaseAuth _auth = FirebaseAuth.instance;
 FirebaseFirestore _firestore = FirebaseFirestore.instance;
 // final EndHouse newHouse = EndHouse(details: details, uid: uid, phone: phone, location: location, gouvernate: gouvernate, price: price, image: image)
 bool _isRed = false;
List<Widget> children = [];


 
dynamic PostUid = FirebaseFirestore.instance.collection('Posts').doc();

    
 class PostWidget extends StatefulWidget {
  final String image ;
  final String price ;
  final String info ;
  final String location ;
  final String gouvernate;
  final String uid ;
  const  PostWidget({Key? key ,required this.image, required this.price, required this.info, required this.location, required this.gouvernate, required this.uid}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {

    /// THE WHITE CONTAINER THAT U SEE IS BECAUSE OF THE OPENCONTAINER WIDGET
    return  OpenContainer(
      openShape :const RoundedRectangleBorder(side: BorderSide.none,borderRadius: BorderRadius.zero),
     openColor: const Color.fromRGBO(248, 248, 248, 10),
      closedColor:const  Color.fromRGBO(248, 248, 248, 10),
      openBuilder: (context,_)=> PostInfoPage(image: widget.image,price: widget.price,details: widget.info,),
      closedBuilder: (context,_)=>
      Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Stack(
                alignment: Alignment.topLeft,
                 children: [Container(
                   width: 360,
                   height: 210,
                   decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.image)),
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
    
    
    
                  Padding(
                      padding: const EdgeInsets.only(top:15,left: 15),
                       child: Container(
                           width: 120,
                          height: 40,
                           decoration: BoxDecoration(
                             color: Colors.white ,
                              borderRadius: BorderRadius.circular(6) ,
                           ),
                           
                           ),
                     ),
                                 Padding(
                               padding: const EdgeInsets.only(top:25,left: 27),
                            child:   Row(
    
                           children:  [
    
                             Text('\$${widget.price}',style:const  TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
    
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
                         Text(widget.location,style:const  TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w500),),
                         const SizedBox(height: 5,),
                         Text(widget.gouvernate,style:const  TextStyle(fontSize: 16,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w400),)
                           ]),
                           const SizedBox(width: 200,),
                          Column(
                            children:  [
                               const SizedBox(height: 24,),
                              InkWell(
                                
                                 onTap: () async{
                                  setState(() {
                                    _isRed = !_isRed;
                                     
                                  });
                                   !_isRed ? PostServices().addPostToFav(PostUid, widget.uid) : PostServices().deletePostFromFav(PostUid, widget.uid);
                                   
                                 },
                                 
                                 child: Icon(CupertinoIcons.heart_solid,size: 33,
                                 color: _isRed ? Colors.white : Colors.red,
                                 )),
                             ],
                           )
                       ],
                     ),
                     const SizedBox(height: 30,)
             ],
           ),
   
    );
  }
}