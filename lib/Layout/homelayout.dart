import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salla/moduels/About%20us/about%20us.dart';
import 'package:salla/moduels/category/cateory%20screen.dart';
import 'package:salla/moduels/profile/profiles%20screen.dart';

import '../moduels/about app/about app.dart';
import '../moduels/category/cateory screen.dart';
import '../moduels/home/home screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), CateoryScreen(), Profile()];



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CircleAvatar(
                     radius: 25,
                     backgroundColor: Colors.blue,
                     child: Icon(

                         Icons.groups_sharp,size: 35,color: Colors.white,


                     ),
                   ),
                 ),

                  TextButton(
                    onPressed: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return TeamInfoScreen();
                        }));  },

                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(

                          color: Colors.blue, borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text('About US',
                            style:
                                TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 25,
                      child: Icon(

                        Icons.adb_sharp,size: 35,color: Colors.white,


                      ),
                    ),
                  ),

                 TextButton(onPressed: ()
                 {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) {
                         return AppPage();
                       }));
                 }, child:  Container(
                   height: 45,
                   width: 200,
                   decoration: BoxDecoration(

                       color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                   child: Center(
                     child: Text(
                       'About Applcation',
                       style: TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),)
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'SALLA ',
          style: TextStyle(backgroundColor: Colors.blue, color: Colors.white),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps, color: Colors.blue), label: 'cateogry'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin, color: Colors.blue),
              label: 'profile'),
        ],
      ),
    );
  }
}
