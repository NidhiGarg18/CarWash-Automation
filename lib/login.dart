import 'package:carwash_automation/signup.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("login"),
            actions: [
              Icon(Icons.line_axis),
            ],
          ),
          body: Form(
              key: _formKey,
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        color: Colors.grey,
                      ),
                      height: 450,
                      width: 300,
                      padding: EdgeInsets.only(
                        left: 50,
                        right: 50,
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: "Email",
                                icon: Icon(Icons.email),
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                              controller: _pass,
                              decoration: InputDecoration(
                                labelText: "Password",
                                icon: Icon(Icons.password),
                                contentPadding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => homepage(),
                                      ));
                                }
                              },
                              child: Text("login")),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Doesn't have account? :"),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => signup(),
                                    ));

                              }, child: Text("Signup")),
                        ],
                      ),
                      ),
                  )
              )
          )
      ),
    );
  }
}
