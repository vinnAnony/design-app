import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Design App"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.red,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.green,
          ),
        ],
      )),
    );
  }
}
