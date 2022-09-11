
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'add_email.dart';
import 'add_phone.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
       resizeToAvoidBottomInset: false,
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
          // const  SizedBox(height: 100,),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: const  [
              Text('Location',style: TextStyle(color:   Color.fromARGB(255, 0, 26, 175),fontSize: 32,fontWeight: FontWeight.w500),)
            ],),
const SizedBox(height: 80,),
            Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
             SizedBox(height: 1,child: Container(color: Colors.black,),
             ),
            InkWell(
              onTap: () {
                Navigator.push(context,
               (CupertinoPageRoute(builder: (context) => const AddEmail())));
              },
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.email,size: 40,),
                      const SizedBox(width: 20,),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Verify using an email',style: TextStyle(fontSize: 22,color: Colors.grey.shade800),),
                              Text('You will recieve a verification code into your email account.',style: TextStyle(fontSize: 14,color: Colors.grey.shade600))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            ),
            SizedBox(height: 1,child: Container(color: Colors.black,),
           ),
            InkWell(
              onTap: (() {
                Navigator.push(context,
               (CupertinoPageRoute(builder: (context) => const AddPhone())));
              }),
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                    const   Icon(Icons.phone,size: 40,),
                      const SizedBox(width: 20,),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Verify using a phone number',style: TextStyle(fontSize: 22,color: Colors.grey.shade800),),
                               Text('You will receive a verification code into your phone number. ',style: TextStyle(fontSize: 14,color: Colors.grey.shade600))
                            ],
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                )),
            ),
            SizedBox(height: 1,child: Container(color: Colors.black,),
           ),])
      ],)),
    );
  }
}