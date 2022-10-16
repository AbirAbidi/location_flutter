

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/house.dart';
import 'package:location_flutter/pages/home_page.dart';
import 'package:location_flutter/pages/profile.dart';
import 'package:location_flutter/services/post_services.dart';
import 'package:location_flutter/widgets/disabled_button.dart';
TextEditingController _info = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _location = TextEditingController();
TextEditingController _gouvernate = TextEditingController();
TextEditingController _price = TextEditingController();
TextEditingController _image = TextEditingController();


bool _isVisible = false;

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
                  resizeToAvoidBottomInset: false,

      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text('Add picture :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),
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
                  controller: _image
                
                ,)),
                      const SizedBox(height: 20,),
                      Text('Add informations :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                      TextField(
                        controller: _info,
                        
                      ),
                      const SizedBox(height: 20,),
                      Text('Add your phone number :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                      TextField(
                        controller: _phone,
                        
                      ),
                      const SizedBox(height: 20,),
                      Text('Add location :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                      TextField(
                        controller: _location,
                        
                      ),
                      const SizedBox(height: 20,),
                      Text('Add gouvernate :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                      TextField(
                        controller: _gouvernate,
                       
                      ),
                      const SizedBox(height: 20,),
                      Text('Add monthly price :',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),SizedBox(height: 10,),
                      TextField(
                        controller: _price,
                        
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
                      const SizedBox(width: 23,),
                      SizedBox(
                        width: 170,
                        child: InkWell(
                          onTap: () {
                          // Navigator.pop(context);
                            EndHouse newHouse = EndHouse(details: _info.text, uid: userUid, phone: _phone.text, location: _location.text, gouvernate: _gouvernate.text, price: _price.text, image: _image.text);
                          try {
                            PostServices().fromDocToAuth(newHouse);
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
        child: const  Center(child: Text('Share post',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),
      ),
                        ),
                      )
                       ],),
                     )
              
              
            ],
          ),
        ),
      )),
    );
  }
}