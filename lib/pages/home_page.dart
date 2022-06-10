import 'package:design_app/pages/login_page.dart';
import 'package:design_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../myDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
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
        body: data != null
            ? Center(
                child: ListView.builder(itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${data[index]["title"]}"),
                    subtitle: Text("${data[index]["id"]}"),
                    leading: Image.network(data[index]["url"]),
                  );
                }),
              )
            : Center(child: CircularProgressIndicator()),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _changedName = _nameController.text;
            setState(() {});
          },
          child: Icon(
            Icons.edit,
          ),
        ));
  }
}
