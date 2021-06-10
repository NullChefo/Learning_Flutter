import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Awesome app"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10), //Paddin
          //color: Colors.red,

          clipBehavior: Clip.antiAlias, // Dosn't expand out of the shape
          width: 100,
          height: 100,
          alignment: Alignment.center,

          decoration: BoxDecoration(
            //Very important
            color: Colors.red,
            //  shape: BoxShape.circle
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.grey],
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 50,
              ),
            ],
          ),

          child: Text(
            "I am a box",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
