import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
          color: Colors.greenAccent,
          height: 100,
          width: 100,
        ),
      ),
      drawer: Drawer(
        //  key: key,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Name"),
              accountEmail: Text("@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Colors.yellowAccent), // can change with Image.network()
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("First Name"),
              subtitle: Text("Last Name"),
              trailing: Icon(Icons.person_add),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("@gmail.com"),
              trailing: Icon(Icons.email_sharp),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        //backgroundColor: Colors.teal,

        onPressed: () {},
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
