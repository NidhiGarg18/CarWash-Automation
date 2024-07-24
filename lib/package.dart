import 'dart:io';

import 'package:carwash_automation/Booking.dart';
import 'package:carwash_automation/homepage.dart';
import 'package:carwash_automation/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categries.dart';
import 'login.dart';
import 'wash_quality.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class package extends StatefulWidget {
  const package({super.key});

  @override
  State<package> createState() => _packageState();
}

class _packageState extends State<package> {
  TextEditingController _name=TextEditingController();
  TextEditingController _price=TextEditingController();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  final _formKey = GlobalKey<FormState>();

  var stream;

  var StreamBuilder;

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link:$urlDownload ');
    setState(() {
      uploadTask == null;
    });
  }

  Future Selectfiles() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Packages"),
          ),
          body: Center(
            child: Column(
              children: [

                if(pickedFile!=null)
                  Expanded(
                    child: Container(
                      color: Colors.blue[100],
                      child:Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        fit:BoxFit.cover,
                      ),
                      // child: Center(
                      //   child: Text(pickedFile!.name),
                      // ),
                    ),
                  ),
                SizedBox(height:80),
                ElevatedButton(onPressed:
                Selectfiles,
                    child: Text("Selectfiles")),
                ElevatedButton(onPressed:
                uploadFile,
                    child: Text("Uploadfiles")
                ),
                SizedBox(height: 20,),

                Center(
                  child: Container(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                                return null;
                              },
                              controller: _name,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                labelText: "Package Name",
                                icon: Icon(Icons.add_box),
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                              )),
                        ),

                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter price';
                              }
                              return null;
                            },
                            controller: _price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Package Price",
                              icon: Icon(Icons.price_change_sharp),
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                            )),

                        SizedBox(height: 40,),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => homepage(),
                                    ));
                              }
                            }, child: Text("Add Package")),
                      ],
                    ),
                  ),
                ),
                // builderProgress(),
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

  Widget builderProgress()=> StreamBuilder(
    stream: uploadTask?.snapshotEvents,
    builder: (context,snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        double progress = data.bytesTransferred / data.totalBytes;
      } else {
        return const SizedBox(height: 50,);
      }
    },
  );
}








