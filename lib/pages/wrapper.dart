import 'package:flutter/material.dart';

import 'auth/authentication_page.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //return home or authenticate widget
    return Authenticate();
  }
}