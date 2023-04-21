import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 1,
        toolbarHeight: 80,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello Hans 👋", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 30),),
                  IconButton(onPressed: (){
                  }, icon: Icon(Icons.search, color: Colors.black, size: 40,))
                ],
              ),
              Text("It's lunch time!", style: TextStyle(color: Colors.black, fontFamily: 'ceraLight', fontSize: 17),),

            ],
          ),
        )
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(13))
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Category", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 20),),
                          Text("See All", style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 20),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
