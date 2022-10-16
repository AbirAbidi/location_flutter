

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_flutter/pages/home_page.dart';
import 'package:location_flutter/pages/sign_up.dart';
import 'package:location_flutter/pages/verification.dart';
import 'package:location_flutter/services/auth.dart';
TextEditingController _emailcntrl =TextEditingController();
TextEditingController _passcntrl =TextEditingController();
bool _showHide = true;
class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
          backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return   Center(child: Center(child: Column(
              children:const  [
                Icon(Icons.error,size: 40,),
                Text('Something went wrong',style: TextStyle(color: Colors.red,fontSize: 40),),
              ],
            )),);
          }
          else{
          return Column(
            children: [
             const  SizedBox(height: 100,),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: const  [
                Text('Location',style: TextStyle(color:  Color.fromARGB(255, 0, 26, 144),fontSize: 32,fontWeight: FontWeight.w500),)
              ],),
              const SizedBox(height:50 ,),
              Padding(
                padding: const EdgeInsets.only(right:31,left: 41 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Text('Login to your Account',style: TextStyle(color: Colors.grey.shade600,fontSize: 23,fontWeight: FontWeight.w500),),
                    const SizedBox(height: 30,),
                    SizedBox(
                      height: 60,
                      child: SizedBox(
                        height: 60,
                        child: TextField(
                          controller: _emailcntrl,
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
                          hintText: 'Email',hintStyle:const  TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w300)),
                          ),
                      ),
                    ),
                     const  SizedBox(height: 20,),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: _passcntrl,
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
                      width: double.infinity,
                       child: CupertinoButton(onPressed: () async { 
                        if (_emailcntrl.text.trim().isEmpty || _passcntrl.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.redAccent,
                                content:
                                    Text('Email or Password cannot be empty !')));
                          }else {
                         dynamic cred =   FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcntrl.text, password: _passcntrl.text);
                          if (cred == null) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.redAccent,
                                content:
                                    Text('Email or Password invalid !')));
                          }else
                          
                          {
                            Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const HomePage()));}
                        }



















                      /*  if (_emailcntrl.text.trim().isEmpty ||
                              _passcntrl.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.redAccent,
                                content:
                                    Text('Email or Password cannot be empty !')));
                          } else {
                          dynamic cred = await AuthServives().loginUser(_emailcntrl.text.trim(), _passcntrl.text);
                       if (cred == null) {
                           const snackbar =  SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: Colors.redAccent,
                                      content:
                                          Text('Email or password invalid !'));
                         } else{
                          Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const HomePage()));
                                      print('log in successful');
                         }
                        }*/
                         
                        },
                       color:const  Color.fromARGB(255, 0, 26, 175) ,
                       child: const Text('Sign in',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w600),) ,
      
                       ),
                     ),
                     Padding(padding: const EdgeInsets.only(top: 10),
                     child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                      (CupertinoPageRoute(builder: (context) => const Verification())));
                      },
                       child: Text('Forgot Password ?',style: TextStyle(color: Colors.grey.shade700,fontSize: 15
                       ),),
                     ),),
                    const  SizedBox(height:80 ),
                     Center(child: Text('-Or sign in with-',style: TextStyle(color:Colors.grey.shade600,fontSize: 16,fontWeight: FontWeight.w600),),),
                    const SizedBox(height: 40,),
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2,right: 5),
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
                                    height: 30,
                                    width: 30,
                                    child: Image.asset('assets/google.png'),)
      
                     ] ),
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
                                    ),
                                    SizedBox(
                                    height: 40,
                                    width: 35,
                                    child: Image.asset('assets/twitter.png'),)
                     ] )
                )
                ],
                ),
                    const SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('Don\'t have an account?',style:TextStyle(fontSize: 16,color: Colors.grey.shade600,fontWeight: FontWeight.w600)),
                       InkWell(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (context)=>const SignUp()));
                        },
                        child: const Text(' Sign up',style:TextStyle(fontSize: 16,color: Color.fromARGB(255, 0, 26, 144),fontWeight: FontWeight.w600))),
                    ],)
                  ],
                ),
              )
            ],
          );}
        }
      ),
    );
  }
}