import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/roommate.dart';
import 'package:location_flutter/services/post_services.dart';

import '../widgets/disabled_button.dart';
import 'home_page.dart';
TextEditingController _info = TextEditingController();
TextEditingController _location= TextEditingController();

Roommate roommate = Roommate(info: _info.text, uid: FirebaseAuth.instance.currentUser!.uid,location: _location.text);
class AddPostRoommate extends StatefulWidget {
  const AddPostRoommate({Key? key}) : super(key: key);

  @override
  State<AddPostRoommate> createState() => _AddPostRoommateState();
}

class _AddPostRoommateState extends State<AddPostRoommate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
                  resizeToAvoidBottomInset: false,

      body: SafeArea(child: SingleChildScrollView(
       
            child : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                      
                          const SizedBox(height: 20,),
                          Text('Add informations :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),const SizedBox(height: 10,),
                          TextField(
                            controller: _info,
                          ),
                          const SizedBox(height: 20,),
                          Text('Add location :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),const SizedBox(height: 10,),
                          TextField(
                            controller: _location,
                          ),
                         const SizedBox(height: 50,),
                          SizedBox(
                          height: 60,
                           child: Row(children: [
                            SizedBox(
                           width: 170,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                              decoration: BoxDecoration(
                                
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10) ,
                                ),
                              child:const  Center(child: Text('Delete post',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                                 
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                           width: 170,
                            child: InkWell(
                              onTap: () {
                                Roommate roommate = Roommate(info: _info.text, uid: FirebaseAuth.instance.currentUser!.uid,location: _location.text);
                               try {
                               PostServices().addPostRoommate(roommate);
                               print('worked');
                            Navigator.push(context,
               (CupertinoPageRoute(builder: (context) => const HomePage())));
                               } catch (e) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                           const     SnackBar(
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.redAccent,
                                  content:
                                      Text("error accured")));
                               }
                              },
                              child: Container(
                              decoration: BoxDecoration(
                                
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10) ,
                                ),
                              child:const  Center(child: Text('Share post',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                                 
                              ),
                            ),
                          ),
                         // const SizedBox(width: 23,),
                          /*DisabledButton(isDisabled: false, onClick: (){
                              Roommate newPostRoommate = Roommate(info: _info.text, uid: FirebaseAuth.instance.currentUser!.uid);
                          })*/
                           ],),
                         )
                  
                  
                ],
              ),
            )
      ))
        
   );
    
  }
}