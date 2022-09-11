

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/services/auth.dart';
import 'package:location_flutter/services/post_services.dart';
import 'package:location_flutter/widgets/post_roommate.dart';

import 'home_page.dart';
TextEditingController _username = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _location = TextEditingController();
TextEditingController _urlAvatar = TextEditingController();

bool _isVisible = false;

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
                  resizeToAvoidBottomInset: false,

      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Text('Update your profile picture :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),
            const SizedBox(height: 20,),
          
              InkWell(
                onTap: () {
                    setState(() {
                      _isVisible = ! _isVisible;
                      print(_isVisible);
                    });
                    
                  },
                child: SizedBox(
                        height: 70,
                        width: 160,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                        color:  Colors.grey.shade300,
                        width: 1,),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10) ,
                            ),   
                         child: Center(
                           child: Row(children: [
                            const SizedBox(width: 5,),
                            const Icon(CupertinoIcons.add,size: 35,),
                            const SizedBox(width: 20,),
                            Text('Import ',style: TextStyle(fontSize: 20,color: Colors.grey.shade700),)
                           ],),
                         ),
                        ),
                      ),
              ),
              const SizedBox(height: 20,),
                Visibility(
                  visible: _isVisible,
                  child: TextField(
                  controller: _urlAvatar
                
                ,)),
                    const SizedBox(height: 20,),
                    Text('Update your username',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: _username,
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 20,),
                    Text('Update your phone number :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: _phone,
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 20,),
                    Text('Update current location :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: _location,
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    
                   const SizedBox(height: 230,),
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
                        child:const  Center(child: Text('Delete changes',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                           
                        ),
                      ),
                    ),
                    const SizedBox(width: 23,),
                    InkWell(
                      onTap: () {
                        try {
                          AuthServives().updateUserData(_username.text,_phone.text,_location.text,_urlAvatar.text,FirebaseAuth.instance.currentUser!.uid);
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
                      child: SizedBox(
                       width: 170,
                        child: Container(
                        decoration: BoxDecoration(
                          
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10) ,
                          ),
                        child: const Center(child: Text('Save changes',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                       
                        ),
                      ),
                    ),
                     ],),
                   )
            
            
          ],
        ),
      )),
    );
  }
}