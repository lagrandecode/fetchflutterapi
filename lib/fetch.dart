import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fetch extends StatefulWidget {
  const Fetch({Key? key}) : super(key: key);

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  List fetchList = [];

  Future<void> fetchdata() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        fetchList = result;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: fetchList.length,
        itemBuilder: (context, _) => Card(
          color: Colors.blueGrey,
          child: ListTile(
            title: Text(fetchList[_]['title'].toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            subtitle: Text(fetchList[_]['description'],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}
