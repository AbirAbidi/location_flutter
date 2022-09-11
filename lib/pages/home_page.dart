
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:location_flutter/pages/favorites.dart';
import 'package:location_flutter/pages/find_roommate.dart';
import 'package:location_flutter/pages/messages.dart';
import 'package:location_flutter/pages/profile.dart';
import 'package:location_flutter/services/post_services.dart';
import 'package:location_flutter/widgets/post_widget.dart';
import '../services/auth.dart';
import '../widgets/post_widget.dart';
int _firstPageInd = 0;
final List<Widget> _listPosts = [];
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _index = 0;
   String name ="";
  void _onItemTapped(int index) {
    setState(() {
      if (index != _firstPageInd) {
        switch (index) {
          case 1:
            setState(() {
              Navigator.push(context,
                  (CupertinoPageRoute(builder: (context) => const Messages())));
            });
            break;
          case 2:
            setState(() {
              Navigator.push(context,
                  (CupertinoPageRoute(builder: (context) => const Favorites())));
            });
            break;
          case 3:
            setState(() {
              Navigator.push(context,
                  (CupertinoPageRoute(builder: (context) => const Profile())));
            });
            break;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor:const Color.fromRGBO(248, 248, 248, 10),
        // drawer
      drawer:  Drawer(
          child: Column(
            children: [
                Stack(
                  alignment: Alignment.center,
                  children: [Container(
                    height: 200,                
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 26, 175),
                               borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)) ,
                    border: Border.all(
                      color:const  Color.fromARGB(255, 0, 26, 175),
                      width: 1,
                    ))
                  ),
                  const Text('Welcome!',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500))
                  ]
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(children: [
                    const   Icon(Icons.home,size:35 ),
                      const SizedBox(width: 15,),
                      Text('Find a home',style: TextStyle(fontSize: 16,color: Colors.grey.shade600,fontWeight: FontWeight.w400))
                    ],),
                  ),
                ),
                const SizedBox(height: 40,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> const FindRoommate()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(children: [
                     const  Icon(Icons.person,size: 35,),
                      const SizedBox(width: 15,),
                      Text('Find a roommate',style: TextStyle(fontSize: 16,color: Colors.grey.shade600,fontWeight: FontWeight.w400))
                    ],),
                  ),
                ),
                const SizedBox(height: 50,),
                 SizedBox(
                 height: 1,
                 child: Container(color: Colors.black,),),
                 const SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 15),
                   child: Row(
                     children: [
                       Text('Communicate',style: TextStyle(fontSize: 18,color: Colors.grey.shade800,fontWeight: FontWeight.w400)),
                     ],
                   ),
                 ),
                 const SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.only(left: 15),
                   child: Row(children: [
                  const   Icon(Icons.share,size: 35,),
                    const SizedBox(width: 15,),
                    Text('Share the app',style: TextStyle(fontSize: 16,color: Colors.grey.shade600,fontWeight: FontWeight.w400))
                ],),
                 ),
            ],
          ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
          onTap: (int val) => setState(() { _index = val;
          _onItemTapped(_index);
          }),
          currentIndex: _index,
          items: [
            FloatingNavbarItem(icon: Icons.home, ),
            FloatingNavbarItem(icon: Icons.chat_bubble_outline,),
            FloatingNavbarItem(icon: CupertinoIcons.heart, ),
            FloatingNavbarItem(icon: Icons.circle,customWidget: ClipOval(child: SizedBox.fromSize(
              size:const  Size.fromRadius(20),
              child: FutureBuilder<DocumentSnapshot>(
                future: AuthServives().getUserData(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, snapshot) {
                  return Image.network('${snapshot.data!["urlAvatar"]}');
                }
              ))) ),
          ],
        ),

      appBar: AppBar(
        iconTheme:const  IconThemeData(color:  Color.fromARGB(255, 0, 26, 175)),
        actions:    [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Filter',style:TextStyle( fontSize: 15,color :   Color.fromARGB(255, 0, 26, 175),fontWeight: FontWeight.w500)),
            ],
          ),
        )],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Text('Current location',style: TextStyle(fontSize: 13,color: Color.fromRGBO(117, 117, 117, 100),fontWeight: FontWeight.w400),),
         const  SizedBox(height: 6,),
          Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: const  [
             // Image.asset('images/location.PNG',height: ,),
               Text('Tunisia,Tun',style:TextStyle(fontSize: 13,color: Color.fromRGBO(24, 24, 24, 100),fontWeight: FontWeight.w500)),
            ],
          )
        ],),
      ),
      body: SafeArea(child: Padding(
              padding: const EdgeInsets.only(left: 24,right: 24),
              child: Column(
                children: [
                 const  SizedBox(height: 40,),
                  SizedBox(
                          height: 60,
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                      offset: const Offset(3, 3), // changes position of shadow
                                ),
                              ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10) ,
                              ),   
                            child: SizedBox(
                              height: 60,
                              child: TextField(  
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search,size: 40,color: Color.fromRGBO(157, 157, 158, 100)),
                                enabledBorder: OutlineInputBorder(
                                            borderSide: const  BorderSide(
                                                color: Colors.white),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                           color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                hintText: 'Search for dream home',hintStyle:const  TextStyle(fontSize: 19,color: Color.fromRGBO(157, 157, 158, 100),fontWeight: FontWeight.w300)),),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50,),
                      // Text(FirebaseAuth.instance.currentUser!.uid),

                         
                        StreamBuilder<QuerySnapshot>(
                           stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
                           builder: ( context,  snapshot) {
                               if (snapshot.hasError) {
                                  return Center(child: Column(children:const  [
                                    Icon(Icons.error,size: 30,color: Colors.red,),
                                    Text('Something went wrong ! ',style: TextStyle(color: Colors.red),)
                                  ],),);
                               }else
                               if (snapshot.connectionState == ConnectionState.waiting){
                                  return const  Center(child: CircularProgressIndicator(),);
                               }
                            else {
                                 return ListView.builder(
                               itemCount:snapshot.data!.docs.length,
                                shrinkWrap: true,
                                 itemBuilder: (context,index){
                                   return  PostWidget();
                                 }
                            );
                               }
                           }
                         )
                        
             ] ),
            )),
          );


      

    
  }
}
