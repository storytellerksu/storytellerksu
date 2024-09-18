// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storytellerai/pages/auth/registration.dart';
import 'package:storytellerai/services/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthorizationService auth = AuthorizationService();
  final globalKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter An Email";
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return "Enter a Password Longer than 6 Characters";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (globalKey.currentState!.validate()) {
                      dynamic result = await auth.emailLogin(email, password);
                      print(result);
                      if (result == null) {
                        setState(() {
                          error = "ERROR bruh";
                        });
                      } else {
                        setState(() {
                          error = "";
                          Navigator.pop(context);
                        });
                      }
                    }
                  },
                  child: Text("Sign In")),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await auth.guestSignIn();
                  if (result == null) {
                    print("Error Logging In");
                  } else {
                    print("Logging In");
                    print(result.uid);
                  }
                },
                child: Text("Sign-in as Guest"),
              ),
              SizedBox(height: 20),
              Text("Don't Have an Account?"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration(),
                      ),
                    );
                  },
                  child: Text("Sign-Up")),
            ],
          ),
        ),
      ),
    );
  }
}
