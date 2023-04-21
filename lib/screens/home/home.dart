import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notey/models/Note.dart';
import 'package:notey/providers/NoteProvider.dart';
import 'package:notey/screens/add_note/add_note.dart';
import 'package:notey/shared/constants/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color pickedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<NoteProvider>(context).allNotes;
    print(value);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black, fontFamily: 'ceraBold', fontSize: 30),),
        elevation: 0,
        actions: [
          PopupMenuButton<Color>(
            onSelected: (i){
              if(i == pickedColor){
                Provider.of<NoteProvider>(context, listen: false).resetNotes();
                setState(() {
                  pickedColor = Colors.black;
                });
              }else{
                Provider.of<NoteProvider>(context, listen: false).filterNotes(i);
                setState(() {
                  pickedColor = i;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(FontAwesomeIcons.sliders, color: darkBlue,),
            ),
            itemBuilder: (BuildContext context) {
              return colors.map((Color color) {
                return PopupMenuItem(
                    value: color,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: (color == pickedColor) ? Border.all(color: Colors.green, width: 4) : Border.all(color: Colors.black, width: 1)
                      ),
                    ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Consumer<NoteProvider>(
            builder: (context, noteProvider, _){
              return noteProvider.allNotes.isEmpty ?
                  Center(
                    child: Text("Nothing for the moment...", style: TextStyle(fontSize: 20, color: Colors.black)),
                  )
              : MasonryGridView.builder(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: noteProvider.allNotes.length,
                itemBuilder: (context, i){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(noteProvider.allNotes[i].title, style: TextStyle(fontFamily: 'ceraBold', fontSize: 25, color: Colors.black),),
                        SizedBox(height: 10,),
                        Text(noteProvider.allNotes[i].desc, style: TextStyle(fontSize: 20, color: Colors.black))
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: noteProvider.allNotes[i].color,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black, width: 1)
                    ),
                  );
                },
              );
            },
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _showFullModal(context);
        },
        backgroundColor: darkBlue,
        elevation: 10,
        tooltip: 'Add Note',
        child: Icon(Icons.add, size: 30,),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showFullModal(context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false, // should dialog be dismissed when tapped outside
      barrierLabel: "Modal", // label for barrier
      transitionDuration: Duration(milliseconds: 150), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) { // your widget implementation
        return AddNotePage();
      },
    );
  }
}
