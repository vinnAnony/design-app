import 'package:flutter/material.dart';

import '../myDrawer.dart';
import '../name_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _changedName = "";
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
          title: Text("Design App"),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
        )),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changedName = _nameController.text;
            setState(() {});
          },
          child: Icon(
            Icons.edit,
          ),
        ));
  }
}
