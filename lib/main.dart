import 'package:flutter/material.dart';
import 'package:notey/providers/AuthProvider.dart';
import 'package:notey/providers/NoteProvider.dart';
import 'package:notey/screens/food/home.dart';
import 'package:notey/screens/home/home.dart';
import 'package:notey/screens/wrapper.dart';
import 'package:notey/shared/constants/colors.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthProvider>(create: (_) => AuthProvider()),
        Provider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ceraRegular',
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: darkBlue,
            secondary: lightBlue,
          ),
        ),
        home: Wrapper(),
        //home: FoodHomePage(),
      ),
    );
  }
}
