import 'dart:convert';
import 'package:awesome_app/widgets/drawer.dart';
import 'package:awesome_app/pages/login_page.dart';
import 'package:awesome_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageFB extends StatelessWidget {
  Future fetchData() async {
    final url = "https://api.coingecko.com/api/v3/coins/";
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Coin Price Tracker"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(child: Text("Fetch something"));
            case ConnectionState.active:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some error occured"),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        snapshot.data[index]["id"].toString().toUpperCase()),
                    subtitle: Text(
                      " ${snapshot.data[index]["symbol"].toString().toUpperCase()}",
                    ),
                    leading: Container(
                        child: Image.network(
                            snapshot.data[index]["image"]["thumb"])),
                    trailing: Text(
                      " ${snapshot.data[index]["market_data"]["current_price"]["usd"].toString().toUpperCase()} USD",
                    ),
                    onTap: () {},
                  );
                },
                itemCount: snapshot.data.length,
              );
          }
          ;
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // # TODO add extra indicator for refreshing
          fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
