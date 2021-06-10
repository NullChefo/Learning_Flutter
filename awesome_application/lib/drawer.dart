import 'package:flutter/material.dart';

class MyDraw extends StatelessWidget {
  const MyDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
