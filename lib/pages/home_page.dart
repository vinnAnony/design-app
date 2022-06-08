import 'package:flutter/material.dart';

import '../myDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
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
            : CircularProgressIndicator(),
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
