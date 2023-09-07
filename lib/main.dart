import 'package:fetch_data/feedbacklist.dart';
import 'package:fetch_data/fetch.dart';
import 'package:fetch_data/models/myform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'kobo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const FeedBackList()));
              },
              child: const Text(
                'Move to the next',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const Fetch()));
              },
              child: Container(
                child: const Text('fetch page',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,),),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ExternalMyApp()));
              },
              child: Container(
                child: Text('Kobotoolbox', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}


