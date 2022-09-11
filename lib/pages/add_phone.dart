import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPhone extends StatelessWidget {
  const AddPhone({Key? key}) : super(key: key);

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
                  Text('Enter Phone number ',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.grey.shade700)),
                ],
              ),
            ),const SizedBox(height: 10,),
                    TextField(
                      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                    const SizedBox(height: 60,),
                    SizedBox(
                     width: 170,
                     height: 50,
                      child: Container(
                      decoration: BoxDecoration(
                        
                          color: const Color.fromARGB(255, 0, 26, 175),
                          borderRadius: BorderRadius.circular(10) ,
                        ),
                      child: const Center(child: Text('Send',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                     
                      ),
                    ),

      ],)),
    );
  }
}