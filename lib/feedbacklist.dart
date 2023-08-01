import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FeedBackList extends StatefulWidget {
  const FeedBackList({Key? key}) : super(key: key);

  @override
  State<FeedBackList> createState() => _FeedBackListState();
}

class _FeedBackListState extends State<FeedBackList> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController descripController = TextEditingController();

  Future<void> submit() async {
    const url = 'https://souvenirapi.up.railway.app/feedback/';
    final text = _nameController.text;
    final description = descripController.text;
    final body = {"name": text, "description": description};
    final response =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'enter name'),
              maxLines: 2,
            ),
            TextField(
              controller: descripController,
              decoration: const InputDecoration(hintText: 'enter description'),
              maxLines: 3,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: submit,
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
