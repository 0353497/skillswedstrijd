import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillswedstrijd/pages/agenda.dart';
import 'dart:convert';

import 'package:skillswedstrijd/pages/homepage.dart';

class Tickets extends StatefulWidget {
  final int ticket;
  const Tickets({super.key, required this.ticket});
  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
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
    bool ischecked = false;
    if (concerten.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(175, 73, 38, 1),
          title: Text('Ticket'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                'assets/media/${concerten[widget.ticket - 1]['imageUrl']}'),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    concerten[widget.ticket - 1]['date'],
                    style: TextStyle(
                        color: Color.fromRGBO(23, 80, 181, 1),
                        fontFamily: 'Manier',
                        fontSize: 20),
                  ),
                  Text('Tickets',
                      style: TextStyle(
                          color: Color.fromRGBO(23, 80, 181, 1),
                          fontFamily: 'Manier',
                          fontSize: 25)),
                  Text('Naam',
                      style: TextStyle(
                          color: Color.fromRGBO(23, 80, 181, 1),
                          fontFamily: 'Manier')),
                  TextFormField(),
                  Text('Email',
                      style: TextStyle(
                          color: Color.fromRGBO(23, 80, 181, 1),
                          fontFamily: 'Manier')),
                  TextFormField(),
                  Text('aantal Tickets',
                      style: TextStyle(
                          color: Color.fromRGBO(23, 80, 181, 1),
                          fontFamily: 'Manier')),
                  TextFormField(),
                  Text('Nieuwsbrief',
                      style: TextStyle(
                          color: Color.fromRGBO(23, 80, 181, 1),
                          fontFamily: 'Manier')),
                  Checkbox(
                    value: ischecked,
                    onChanged: (bool? ischecked) {
                      setState(() {
                        ischecked = ischecked!;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Koop Ticket'),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromRGBO(23, 80, 181, 1)),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            NavigationBar(
              destinations: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    icon: Icon(
                      Icons.home,
                      color: Color.fromRGBO(241, 241, 248, 1),
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Agenda()));
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Color.fromRGBO(241, 241, 248, 1),
                    )),
              ],
              backgroundColor: Color.fromRGBO(215, 164, 146, 1),
              overlayColor:
                  WidgetStatePropertyAll(Color.fromRGBO(241, 241, 248, 1)),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('loading...'),
        ),
      );
    }
  }
}
