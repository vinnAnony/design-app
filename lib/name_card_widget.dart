import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({
    Key key,
    @required String changedName,
    @required TextEditingController nameController,
  })  : _changedName = changedName,
        _nameController = nameController,
        super(key: key);

  final String _changedName;
  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset("assets/images/bg.jpg"),
          SizedBox(
            height: 20,
          ),
          Text(
            _changedName,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter new name",
                  labelText: "Name"),
            ),
          )
        ],
      ),
    );
  }
}
