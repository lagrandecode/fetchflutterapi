import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:xml/xml.dart';

const String BASE_URL = 'https://kc.kobotoolbox.org';
const String SUMISSION_URL = '$BASE_URL/api/v1/submissions';
const String TOKEN = '6fb29d8015dc136cba3558590282ddab7f2b24a5'; // Replace with your KoboToolbox API token

class MyForm {
  String name;

  MyForm({required this.name});

  String toXml() {
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0" encoding="utf-8"');
    builder.element('root', nest: () {
      builder.element('_id', nest: 'uuid:${'43e93d84ef2341a89b562d41db6bd829'}');
      builder.element('formhub/uuid', nest: '43e93d84ef2341a89b562d41db6bd829');
      builder.element('start', nest: DateTime.now().toIso8601String());
      builder.element('end', nest: DateTime.now().toIso8601String());
      builder.element('name', nest: name);
      builder.element('__version__', nest: 'vKMXGsXb7sEw42x2hnDqcf');
      builder.element('meta', nest: () {
        builder.element('instanceID', nest: 'uuid:${'43e93d84ef2341a89b562d41db6bd829'}');
      });
    });

    final xmlDoc = builder.buildDocument();
    return xmlDoc.toXmlString(pretty: true);
  }
}

Future<String> submitData(String name) async {
  final myForm = MyForm(name: name);
  final xmlData = myForm.toXml();

  final response = await http.post(
    Uri.parse(SUMISSION_URL),
    headers: {
      'Authorization': 'Token $TOKEN',
      'Content-Type': 'application/xml',
    },
    body: xmlData,
  );

  if (response.statusCode == 201) {
    return 'Success 🎉';
  } else {
    return 'Something went wrong 😢';
  }
}

class ExternalMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Submission'),
        ),
        body: MyFormWidget(),
      ),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final TextEditingController _nameController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = _nameController.text;
              final result = await submitData(name);
              setState(() {
                _message = result;
              });
            },
            child: Text('Submit'),
          ),
          Text(_message),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
