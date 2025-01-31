import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class Contact extends StatefulWidget {
  const Contact({super.key, index});
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<dynamic> concerten = [];

  @override
  void initState() {
    super.initState();
    _loadConcerten();
  }

  Future<void> _loadConcerten() async {
    try {
      String jsonString = await rootBundle.loadString('assets/concerts.json');
      List<dynamic> jsonData = jsonDecode(jsonString)['concerts'];

      setState(() {
        concerten = jsonData;
      });
    } catch (e) {
      setState(() {
        concerten = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 248, 1),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(175, 73, 38, 1),
        title: Text(
          'contact',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text('contact'),
      ),
    );
  }
}
