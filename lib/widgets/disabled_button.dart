import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisabledButton extends StatefulWidget {
  const DisabledButton({Key? key, required this.isDisabled, required this.onClick}) : super(key: key);
final bool isDisabled ;
final Function onClick ;
  @override
  State<DisabledButton> createState() => _DisabledButtonState();
}

class _DisabledButtonState extends State<DisabledButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Container(
        decoration: BoxDecoration(
                            
                              color: widget.isDisabled ? Colors.grey : Colors.green,
                              borderRadius: BorderRadius.circular(10) ,
                            ),
        
        child: CupertinoButton(child:const  Center(child: Text('Share post',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.white)),), onPressed: (){
          widget.isDisabled ?null : widget.onClick();
        }),
      ),
    );
  }
}