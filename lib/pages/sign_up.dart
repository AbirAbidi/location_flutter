import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/models/user.dart';
import 'package:location_flutter/pages/usercred.dart';

import '../services/auth.dart';
import 'home_page.dart';
TextEditingController emailcntrl =TextEditingController();
TextEditingController passcntrl =TextEditingController();
TextEditingController _passcntrl2 =TextEditingController();
bool _showHide = true;
bool _showHide2 = true;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
          backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
        //  backgroundColor:Colors.white,
      body: SafeArea(
        child: Column(
          children: [
          Row(
            children: [
              Padding(
                              padding: const EdgeInsets.only(left: 15,top: 10),
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
          // const  SizedBox(height: 100,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: const  [
              Text('Location',style: TextStyle(color:   Color.fromARGB(255, 0, 26, 175),fontSize: 32,fontWeight: FontWeight.w500),)
            ],),
            const SizedBox(height:50 ,),
            Padding(
              padding: const EdgeInsets.only(right:31,left: 41 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   Text('Create your Account',style: TextStyle(color: Colors.grey.shade600,fontSize: 23,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 60,
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        controller: emailcntrl,
                        decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                                    borderSide: const  BorderSide(
                                        color: Color.fromRGBO(112, 112, 112, 26)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                   color: Color.fromRGBO(112, 112, 112, 26)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                        hintText: 'Email',hintStyle:const  TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w300)),),
                    ),
                  ),
                   const  SizedBox(height: 20,),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: passcntrl,
                        obscureText: _showHide,
                        decoration: InputDecoration(
                          suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showHide = !_showHide;
                                  });
                                },
                                child: Text(_showHide ? 'Show' : 'Hide')),
                      enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(
                                color: Color.fromRGBO(112, 112, 112, 26)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                   color: Color.fromRGBO(112, 112, 112, 26)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                      hintText: 'Password',hintStyle: const TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w300)),),
                    ),
                    const  SizedBox(height: 20,),
                    SizedBox(
                      height: 60,
                      child: TextField(
                        controller: _passcntrl2,
                        obscureText: _showHide2,
                        decoration: InputDecoration(
                          suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showHide2 = !_showHide2;
                                  });
                                },
                                child: Text(_showHide2 ? 'Show' : 'Hide')),
                      enabledBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(
                                color: Color.fromRGBO(112, 112, 112, 26)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                   color: Color.fromRGBO(112, 112, 112, 26)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                      hintText: 'Confirm Password',hintStyle: const TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w300)),),
                    ),
                   const  SizedBox(height: 20,),
                   SizedBox(
                    height: 60,
                    width: double.infinity,
                     child: CupertinoButton(onPressed: ()async {
                      if (emailcntrl.text.trim().isEmpty &&
                            passcntrl.text.isEmpty && _passcntrl2.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.redAccent,
                              content:
                                  Text('Email or Password cannot be empty !')));
                        }  else
                          if (emailcntrl.text.isNotEmpty && (passcntrl.text != _passcntrl2.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.redAccent,
                              content:
                                  Text('Type Password again !')));
                          } else
                            if (emailcntrl.text.trim().isNotEmpty && passcntrl.text.isNotEmpty && _passcntrl2.text.isNotEmpty &&(passcntrl.text == _passcntrl2.text)) {
                             Navigator.push(context, CupertinoPageRoute(builder: (context)=>const Usercred()));
                            }
                            
                          
                        
                       },
                     color:  const Color.fromARGB(255, 0, 26, 175) ,
                     child: const Text('Sign up',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w600),) ,
        
                     ),
                   ),
                   // here 
                   /* TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                      fillColor:const  Color.fromRGBO(30, 49, 157, 100),
                    enabledBorder: OutlineInputBorder(
                                borderSide: const  BorderSide(
                                    color: Colors.transparent
                                    ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                    hintText: 'Sign in',hintStyle: const TextStyle(fontSize: 19,color: Color.fromRGBO(227, 227, 230, 100),fontWeight: FontWeight.w600)),),*/
                  const  SizedBox(height:90 ),
                   Center(child: Text('-Or sign in with-',style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w600),),),
                  const SizedBox(height: 40,),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2,right: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
               (CupertinoPageRoute(builder: (context) => const HomePage())));
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children:[ Container(   
                            height: 65,
                            width: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: const Offset(0, 2), // changes position of shadow
                              ),
                            ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10) ,
                            ),   
                            
                                     ),
                                     SizedBox(
                                      //color: Colors.amber,
                                    height: 30,
                                    width: 30,
                                    child: Image.asset('assets/google.png'),)
                              
                                         ] ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 10,right: 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [Container(  
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10) ,
                          ),  
                       ),
                      
         SizedBox(
                                    //color: Colors.amber,
                                  height: 40,
                                  width: 50,
                                  child: Image.asset('assets/facebook.png'),)] ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(left: 12,right: 5),
                      child: Stack(
                        alignment: Alignment.center,
                        children:[ Container(  
                          height: 65,
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],    
                          
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10) ,
                          ),  
                                 
                                 
                                         /*  decoration: const BoxDecoration(
                           color: Colors.red,
                       /*   image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("images/apple.png"),
                          ),*/
                               ),*/
                                        
                                  ),
                                  SizedBox(
                                    //color: Colors.amber,
                                  height: 40,
                                  width: 35,
                                  child: Image.asset('assets/twitter.png'),)
                   ] )
              )
              ],
              ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}