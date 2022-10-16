
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/text_roommate_post.dart';

class DetailsPostRoommate extends StatefulWidget {
  final urlAvatar ;
  final details ;
  final name;
  const DetailsPostRoommate({Key? key, this.urlAvatar, this.details, this.name}) : super(key: key);

  @override
  State<DetailsPostRoommate> createState() => _DetailsPostRoommateState();
}

class _DetailsPostRoommateState extends State<DetailsPostRoommate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left:24,bottom: 20 ),
        child: SizedBox(
                      height: 60,
                       child: Row(children: [
                        SizedBox(
                       width: 170,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
               (CupertinoPageRoute(builder: (context) => const TextRoommate())));
                          },
                          child: Container(
                          decoration: BoxDecoration(
                            
                              color:const  Color.fromARGB(255, 0, 26, 175),
                              borderRadius: BorderRadius.circular(10) ,
                            ),
                          child:const  Center(child: Text('Text Me',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                                             
                          ),
                        ),
                      ),
                      const SizedBox(width: 23,),
                      SizedBox(
                       width: 170,
                        child: Container(
                        decoration: BoxDecoration(
                          
                            color: const Color.fromARGB(255, 0, 26, 175),
                            borderRadius: BorderRadius.circular(10) ,
                          ),
                        child: const Center(child: Text('Call Me',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),),   
                       
                        ),
                      ),
                       ],),
                     ),
      ),
      backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 20),
          child: Row(children: [
              InkWell(
                    onTap: () {
                       Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10) ,
                      border: Border.all(
                        color:  Colors.grey.shade300,
                        width: 1,
                      )),
                    child:const  Icon(Icons.arrow_back,color:   Color.fromARGB(255, 0, 26, 175) ,),
                            ),
                  ),
                  const SizedBox(width: 20,),
                  ClipOval(
                    child: SizedBox.fromSize(
                      size:const  Size.fromRadius(40),
                      child: Image.network(      
                        widget.urlAvatar,
                        ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                   Text('${widget.name}',style:const  TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
            ],),
            
        ),
        const SizedBox(height: 30,),
        Expanded
        (
          child: SizedBox(
            width: double.maxFinite,
           // height: double.maxFinite,
          //  color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Flexible(child: Text(widget.details,style: const TextStyle(fontSize: 17),))
              ],),
            ),
          ),
        )
      ],)),
    );
  }
}