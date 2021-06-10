import 'package:awesome_application/card.dart';
import 'package:awesome_application/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();

  var url = Uri.parse("https://api.coingecko.com/api/v3/coins/");

  var data = [];

  void fetchData() async {
    http.Response response = await http.get(url);

    print(response.body);

// #TODO 1.37.00
    data = JsonDecoder(response.body);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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

      body: data != null
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),

      // body: Center(
      //      child: Padding(
      //    padding: EdgeInsets.all(16.0),
      //   child: SingleChildScrollView(
      //      child: myCard(myText: myText, nameController: _nameController),
      //     ),
      //      ),
      // ),

      drawer: MyDraw(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        //backgroundColor: Colors.teal,

        onPressed: () {
          //myText = _nameController.text;
          // setState(() {});
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
