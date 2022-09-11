import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
TextEditingController _emailcntrl = TextEditingController();
class AddEmail extends StatelessWidget {
  const AddEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
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
          Row(mainAxisAlignment: MainAxisAlignment.center,children: const  [
              Text('Location',style: TextStyle(color:   Color.fromARGB(255, 0, 26, 175),fontSize: 32,fontWeight: FontWeight.w500),)
            ],),
            const SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: [
                  Text('Enter Email address',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),
                ],
              ),
            ),const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: TextField(
                        controller: _emailcntrl,
                        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                      ),
                    ),
                    const SizedBox(height: 60,),
                    InkWell(
                      onTap: () {


                        if (_emailcntrl.text.trim().isNotEmpty) {
                          Future resetPasswoerd()async{
                          showDialog(
                            barrierDismissible: false,
                            context: context, builder: ((context)=>Center(child: CircularProgressIndicator(),)));
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcntrl.text.trim());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green,
                                  content:
                                      Text('Password reset email sent  !')));
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                          }on FirebaseAuthException catch (e) {
                            print(e);
                            ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                  duration:const Duration(seconds: 3),
                                  backgroundColor: Colors.redAccent,
                                  content:
                                      Text(e.message!)));
                                      Navigator.of(context).pop();
                          }
                        }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.redAccent,
                                  content:
                                      Text('Please enter an email address !')));
                        }
                        
                      },
                      child: SizedBox(
                       width: 170,
                       height: 50,
                        child: Container(
                        decoration: BoxDecoration(
                          
                            color: const Color.fromARGB(255, 0, 26, 175),
                            borderRadius: BorderRadius.circular(10) ,
                          ),
                        child: const Center(child: Text('Reset Password',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                       
                        ),
                      ),
                    ),

      ],)),
    );
  }
}