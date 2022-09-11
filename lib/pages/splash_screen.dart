import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_flutter/pages/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }
      _navigatetohome()async{
        await Future.delayed(const Duration(seconds: 2),(){});
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context)=>const SignIN()));
      }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color.fromARGB(255, 0, 26, 175),
      body:  SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const  [
            Text('Location',style: TextStyle(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white),),
          ],
        ),
      )),
    );
  }
}