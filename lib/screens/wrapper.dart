
import 'package:flutter/material.dart';
import 'package:notey/providers/AuthProvider.dart';
import 'package:notey/screens/authenticate/authenticate.dart';
import 'package:notey/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // return either the Home or Authenticate widget
    if (!authProvider.isLogged){
      return Authenticate();
    } else {
      return HomePage(title: "Note List",);
    }

  }
}