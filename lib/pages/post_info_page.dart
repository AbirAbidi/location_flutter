import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/messages.dart';
import 'package:location_flutter/pages/text_roommate_post.dart';

class PostInfoPage extends StatefulWidget {
  final image ;
  final price ;
  final details ;
  const PostInfoPage({Key? key, this.image, this.price, this.details,}) : super(key: key);

  @override
  State<PostInfoPage> createState() => _PostInfoPageState();
}

class _PostInfoPageState extends State<PostInfoPage> {
  @override
  Widget build(BuildContext context) {
    
    
        return Scaffold(
        backgroundColor :  const Color.fromRGBO(248, 248, 248, 10),
          extendBody: true,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left:24,bottom: 20 ),
            child: SizedBox(
                          height: 60,
                           child: Row(children: [
                            SizedBox(
                           width: 170,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                   (CupertinoPageRoute(builder: (context) => const TextRoommate())));
                              },
                              child: Container(
                              decoration: BoxDecoration(
                                
                                  color:const  Color.fromARGB(255, 0, 26, 175),
                                  borderRadius: BorderRadius.circular(10) ,
                                ),
                              child:const  Center(child: Text('Text Me',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                                 
                              ),
                            ),
                          ),
                          const SizedBox(width: 23,),
                          SizedBox(
                           width: 170,
                            child: Container(
                            decoration: BoxDecoration(
                              
                                color: const Color.fromARGB(255, 0, 26, 175),
                                borderRadius: BorderRadius.circular(10) ,
                              ),
                            child: const Center(child: Text('Call Me',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                           
                            ),
                          ),
                           ],),
                         ),
          ),
          body: SafeArea(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [Stack(
                  alignment: Alignment.topLeft,
                  children: [Stack(
                    children: [Container(
                      width: 360,
                      height: 420,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.image)),
                        color: Colors.red ,
                         borderRadius: BorderRadius.circular(20) ,
                        
                      ),
                    ),
                    Padding(
                            padding: const EdgeInsets.only(left: 305,top: 40),
                            child: InkWell(
                          onTap: () {
                          Navigator.pop(context);
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
                          child:const Center(child:   Icon(CupertinoIcons.heart,color:  Colors.white ,size: 30,)),
                              ),
                            ),)
                          
                    ]
                  ),
                  Padding(
                            padding: const EdgeInsets.only(left: 15,top: 40),
                            child: InkWell(
                          onTap: () {
                          Navigator.pop(context);
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
                          child:InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const  Icon(Icons.arrow_back,color:  Colors.white ,)),
                              ),
                            ),)
                          
                  ]
                ),
                 Padding(
                      padding: const EdgeInsets.only(top:40,left: 15),
                      child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white ,
                             borderRadius: BorderRadius.circular(6) ,
                          )
                          ),
                    ),
         Positioned(
      left: 115,
      child:   Padding(
      
        padding: const EdgeInsets.only(top:50,left: 27),
      
        child:Row(
                children:  [
                Text('\$${widget.price}',style: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
              const   Text('/month',style:TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300))
                    ]
                    ), 
                 ),
                      )
                 ]
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                     const  SizedBox(height: 30,),
                      Text('Details',style: TextStyle(fontSize: 25,color: Colors.grey.shade800,fontWeight: FontWeight.w400),),
                    const   SizedBox(height: 20,),
                       Text('${widget.details}',style: TextStyle(fontSize: 16,color: Colors.grey.shade700,fontWeight: FontWeight.w400),)
                        ]),
                    ),
                    //const SizedBox(height: 30,)
                    
            ],
        ),
          )),
        );
      }
    

  
}