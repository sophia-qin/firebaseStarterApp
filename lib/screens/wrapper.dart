import 'package:firebasetutorial/screens/authentication/authenticate.dart';
import 'package:firebasetutorial/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    return Authenticate();
  }
}
