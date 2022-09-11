import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/user.dart';
import 'package:location_flutter/pages/sign_up.dart';

import '../services/auth.dart';
import 'home_page.dart';
bool _isVisible = false;
TextEditingController username = TextEditingController();
TextEditingController _urlAvatar = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController location = TextEditingController();
class Usercred extends StatefulWidget {
  const Usercred({Key? key}) : super(key: key);

  @override
  State<Usercred> createState() => _UsercredState();
}

class _UsercredState extends State<Usercred> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
          backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
            children: [
              Padding(
                              padding: const EdgeInsets.only(top: 10),
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
                            color:  Colors.grey.shade400,
                            width: 1,
                            )),
                            child:const  Icon(Icons.arrow_back,color:   Color.fromARGB(255, 0, 26, 175) ,),
                                ),
                              ),
                            ),
            ],
          ),
            const SizedBox(height: 30,),
            Text('Add your profile picture :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),
            const SizedBox(height: 20,),
          
              InkWell(
                onTap: () {
                    
                    setState(() {
                      _isVisible = !_isVisible;
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
                    Text('Add your username',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: username,
                      
                    ),
                    const SizedBox(height: 20,),
                    Text('Add your phone number :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: phone,
                      
                    ),
                    const SizedBox(height: 20,),
                    Text('Add current location :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                    TextField(
                      controller: location,
                      
                    ),
                    
                   const SizedBox(height: 40,),
                    SizedBox(
                    height: 60,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     
                    const SizedBox(width: 23,),
                    InkWell(
                      onTap: () {
                        try {
                         EndUser newUser = EndUser(uid: 'uid',email: emailcntrl.text,username: username.text,phone: phone.text,location: location.text,urlAvatar: _urlAvatar.text);

                          AuthServives().registerUser(newUser, passcntrl.text);
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
                          
                            color: const Color.fromARGB(255, 0, 26, 175),
                            borderRadius: BorderRadius.circular(10) ,
                          ),
                        child: const Center(child: Text('Ok',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white)),),   
                       
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