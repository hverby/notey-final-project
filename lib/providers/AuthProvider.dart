import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
  bool _isLogged = false;

  bool get isLogged {
    return _isLogged;
  }
  void login(){
    _isLogged = !_isLogged;
    notifyListeners();
  }
}