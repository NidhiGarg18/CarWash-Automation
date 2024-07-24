import 'package:carwash_automation/login.dart';
import 'package:flutter/material.dart';

import 'categries.dart';
import 'homepage.dart';
import 'package.dart';
import 'wash_quality.dart';
class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  String dropdownvalue = 'Small';
  String dropdownvalue1='Basic';
  var items = [
    'Small',
    'Medium',
    'Large',
  ];
  var items1=[
    'Basic',
    'Premium',
    'Delux',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Booking"),
        ),
        body: Center(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/img_6.jpg", width: 250, height: 250,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80,right: 150),
                child: Text("Select a Vehicle"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200,bottom: 50),
                child: Column(
                  children: [
                    Text('Select a Quality'),
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100,),
                    child: DropdownButton(

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 100,left: 50),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue1,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items1.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),



        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> homepage(),));
                },
              ),
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
