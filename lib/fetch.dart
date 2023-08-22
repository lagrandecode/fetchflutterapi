



import 'package:flutter/material.dart';

class Fetch extends StatelessWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (_,context)=>const ListTile(
            title: Text('hello 1'),
            subtitle: Text('hello 2'),

      )),
    );
  }
}
