
import 'package:flutter/material.dart';
import 'package:notey/providers/AuthProvider.dart';
import 'package:notey/screens/home/home.dart';
import 'package:notey/shared/constants/colors.dart';
import 'package:notey/shared/constants/text_Input.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Register", style: TextStyle(color: red, fontFamily: 'ceraBold', fontSize: 30)),
                  ],
                ),
                SizedBox(height: 7,),
                Row(
                  children: [
                    Text("Get started right here...", style: TextStyle(color: Colors.black, fontSize: 17)),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 110.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  //setState(() => email = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                obscureText: true,
                                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                                onChanged: (val) {
                                  //setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                obscureText: true,
                                decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                                onChanged: (val) {
                                  //setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 30.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(200,60),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                ),
                                child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'ceraMedium')),
                                onPressed: (){
                                  Provider.of<AuthProvider>(context, listen: false).login();
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) => HomePage(title: "Note List")));
                                },
                              )

                            ],
                          ),
                        ),
                      ),
                    )
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already member?", style: TextStyle(color: Colors.black, fontSize: 15)),
                    SizedBox(width: 5,),
                    InkWell(
                        onTap: () => widget.toggleView(),
                        child: Text("Sign In", style: TextStyle(color: red, fontSize: 17, fontFamily: 'ceraMedium'))
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
