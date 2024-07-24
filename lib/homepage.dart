import 'dart:async';

import 'package:carwash_automation/Booking.dart';
import 'package:carwash_automation/package.dart';
import 'package:flutter/material.dart';

import 'categries.dart';
import 'login.dart';
import 'wash_quality.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('CarWash'),
        ),
        body: Center(

          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img_1.jpg", width: 200, height: 200,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img_5.jpg", width: 200, height: 140,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/img_4.jpg", width: 200, height: 140,),
                    ),
                    Image.asset(
                      "assets/splashscreen.jpg", width: 200, height: 200,),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right:300),
                child: Text("Categories"),
              ),
              Container(
              ),
              Padding(
                padding: const EdgeInsets.only(right:250,top:180),
                child: Text("Featured Package"),
              ),
              Container(
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 180, left: 280),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login(),
                          ));
                    }, label: Icon(Icons.add,),
                  ),
                ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('All Category'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text(' Add Category '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> categries(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text(' All Package '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text(' Add Package'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> package(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.request_page),
                title: const Text(' Service Request '),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> booking(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.price_change),
                title: const Text('Pricing & Payment'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> washquality(),));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> login(),));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
