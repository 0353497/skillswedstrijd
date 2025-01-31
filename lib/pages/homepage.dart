import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillswedstrijd/components/nav.dart';
import 'dart:convert';

import 'package:skillswedstrijd/pages/agenda.dart';
import 'package:skillswedstrijd/pages/contact.dart';
import 'package:skillswedstrijd/pages/tickets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Manrope'),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 248, 1),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color.fromRGBO(175, 73, 38, 1),
                  child: Row(
                    children: [
                      Image.asset(
                        color: Color.fromRGBO(215, 164, 146, 1),
                        'assets/media/images/echo_logo.png',
                        height: 100,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Echo',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Manier',
                              fontSize: 30,
                              color: Color.fromRGBO(241, 241, 248, 1),
                            ),
                          ),
                          Text(
                            'Utrecht',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Manier',
                              fontSize: 16,
                              color: Color.fromRGBO(241, 241, 248, 1),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Uitgelicht'),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 5,
                              children: [
                                if (concerten.isNotEmpty)
                                  ...List.generate(concerten.length, (i) {
                                    //als het highlighted is
                                    if (i == 6 || i == 9 || i == 13) {
                                      return SizedBox(
                                        width: 350,
                                      child: Card(
                                        color: Color.fromRGBO(215, 164, 146, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/media/${concerten[i]['imageUrl']}',
                                                width: 350,
                                              height: 200,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      concerten[i]['title'],
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Tickets(
                                                                          ticket:
                                                                              concerten[i]['id'],
                                                                        )));
                                                      },
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Color
                                                                      .fromRGBO(
                                                                          23,
                                                                          80,
                                                                          181,
                                                                          1)),
                                                          foregroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Colors
                                                                      .white)),
                                                      child:
                                                          Text('Boek Ticket'),
                                                    ),
                                                    Text(
                                                      concerten[i]['date'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                    } else {
                                      return SizedBox(
                                        width: 0,
                                      );
                                    }
                                  })
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Aankomende concerten'),
                          //todo cards in a horizontal scroll view
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              spacing: 20,
                              children: [
                                if (concerten.isNotEmpty)
                                  ...List.generate(concerten.length, (i) {
                                    return SizedBox(
                                      width: 250,
                                      child: Card(
                                        color: Color.fromRGBO(215, 164, 146, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/media/${concerten[i]['imageUrl']}',
                                              width: 250,
                                              height: 200,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      concerten[i]['title'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Color
                                                                      .fromRGBO(
                                                                          23,
                                                                          80,
                                                                          181,
                                                                          1)),
                                                          foregroundColor:
                                                              WidgetStatePropertyAll(
                                                                  Colors
                                                                      .white)),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Tickets(
                                                                          ticket:
                                                                              concerten[i]['id'],
                                                                        )));
                                                      },
                                                      child:
                                                          Text('Boek Ticket'),
                                                    ),
                                                    Text(
                                                      concerten[i]['date'],
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getNav(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
