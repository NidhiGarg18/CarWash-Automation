import 'package:flutter/material.dart';
import 'login.dart';
class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _pass = TextEditingController();

  bool _validate = false;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
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
                  height: 520,
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
                                return 'Please enter username';
                              }
                              return null;
                            },
                            controller: _user,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Username",
                              icon: Icon(Icons.supervised_user_circle),
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
                                return 'Please enter email';
                              }
                              return null;
                            },
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
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
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: false,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: "Password",
                              icon: Icon(Icons.password),
                              contentPadding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                            )),

                        TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter phonenumber';
                              }
                              return null;
                            },
                            controller: _phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              icon: Icon(Icons.phone),
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
                                      builder: (context) => login(),
                                    ));
                              }
                            }, child: Text("Signup")),
                      ],
                    ),
                  ),
                )
            )
        ),
      ),
    );
  }
}
