import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextRoommate extends StatefulWidget {
  final name ;
  final image ;
  const TextRoommate({Key? key, this.name, this.image}) : super(key: key);

  @override
  State<TextRoommate> createState() => _TextRoommateState();
}

class _TextRoommateState extends State<TextRoommate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: true,
        //  bottomNavigationBar: 
      body: SafeArea(child: Column(
        children: [
         Row(
           children: [
             Padding(
                            padding: const EdgeInsets.only(left: 15,top: 20),
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
                          color:  Colors.grey.shade300,
                          width: 1,
                          )),
                          child:InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const  Icon(Icons.arrow_back,color:   Color.fromARGB(255, 0, 26, 175) ,)),
                              ),
                            ),),
                            const SizedBox(width: 20,),

                            //container ta3 info
           ],
         ) ,
                        
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                              height: 60,
                               child: Container(
                               decoration:const  BoxDecoration(
                                 
                                   color:  Color.fromARGB(255, 0, 26, 175),
                                   borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20) ) ,
                                 ),
                                child:  Center(child:TextField(
                                  
                         
                          /*  decoration: InputDecoration(
                          //    suffixText: 'Send',
                            enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                       color: Color.fromRGBO(112, 112, 112, 26)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                            hintText: 'Aa',hintStyle:const  TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w500)
                            ),*/
                            ), ),   
                                                  
                               ),
                             ),
                ],
              ),
            ),
        ],
      )
      ),
  
      
    );
  }
}