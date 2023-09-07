import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Kobo extends StatefulWidget {
  const Kobo({Key? key}) : super(key: key);

  @override
  State<Kobo> createState() => _KoboState();
}

class _KoboState extends State<Kobo> {
  String BASE_URL = 'https://kc.kobotoolbox.org';
  String SUBMISSION_URL = 'BASE_URL/api/v1/submissions';
  String TOKEN = '6fb29d8015dc136cba3558590282ddab7f2b24a5';




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Kobo page')),
      ),
    );
  }
}
