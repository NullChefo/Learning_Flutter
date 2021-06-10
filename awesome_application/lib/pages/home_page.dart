import 'package:awesome_application/card.dart';
import 'package:awesome_application/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My Name";
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome app"),
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: myCard(myText: myText, nameController: _nameController),
          ),
        ),
      ),

      drawer: MyDraw(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        //backgroundColor: Colors.teal,

        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
