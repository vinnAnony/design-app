import 'package:design_app/pages/login_page.dart';
import 'package:design_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../myDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageFuture extends StatelessWidget {
  Future fetchData() async {
    final url = "https://jsonplaceholder.typicode.com/photos";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Design App"),
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: fetchData(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some error occurred."),
                );
              }
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${snapshot.data[index]["title"]}"),
                  subtitle: Text("${snapshot.data[index]["id"]}"),
                  leading: Image.network(snapshot.data[index]["url"]),
                );
              });
          }
        },
      ),
    );
  }
}
