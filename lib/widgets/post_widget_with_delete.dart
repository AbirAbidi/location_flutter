import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostWidgetWithDelete extends StatefulWidget {
  const PostWidgetWithDelete({Key? key}) : super(key: key);

  @override
  State<PostWidgetWithDelete> createState() => _PostWidgetWithDeleteState();
}

class _PostWidgetWithDeleteState extends State<PostWidgetWithDelete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [Container(
              width: 360,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.red ,
                 borderRadius: BorderRadius.circular(10) ,
                
              ),
            ),


            
             Padding(
                  padding: const EdgeInsets.only(top:15,left: 15),
                  child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white ,
                         borderRadius: BorderRadius.circular(6) ,
                      )
                      ),
                ),
Padding(
  padding: const EdgeInsets.only(top:25,left: 27),
  child:   Row(
  
                      children: const [
  
                        Text('\$1,199',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w500),),
  
                        Text('/month',style:TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300))
  
                      ]
  
                    ),
)
              
                  
             ]
             
                ),
                Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:const [
                    SizedBox(height: 20,),
                    Text('Lac 2',style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.w500),),
                    SizedBox(height: 7,),
                    Text('Tunisia, Tunisia',style: TextStyle(fontSize: 16,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w400),)
                      ]),
                      const SizedBox(width: 200,),
                      Column(
                        children: const [
                          SizedBox(height: 24,),
                          Text('Delete',style: TextStyle(color: Colors.red),),
                        ],
                      )
                  ],
                )
        ],
      ),
    );
       
  }
}