import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillswedstrijd/components/nav.dart';
import 'package:skillswedstrijd/pages/tickets.dart';
import 'dart:convert';


class Agenda extends StatefulWidget {
  const Agenda({super.key, index});
  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
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
          'Agenda',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (concerten.isNotEmpty)
                    ...List.generate(concerten.length, (i) {
                      return SizedBox(
                        width: 350,
                        child: Card(
                          color: Color.fromRGBO(215, 164, 146, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        concerten[i]['title'],
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Tickets(
                                                        ticket: concerten[i]
                                                            ['id'],
                                                      )));
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Color.fromRGBO(
                                                        23, 80, 181, 1)),
                                            foregroundColor:
                                                WidgetStatePropertyAll(
                                                    Colors.white)),
                                        child: Text('Boek Ticket'),
                                      ),
                                      Text(
                                        concerten[i]['date'],
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
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
            getNav(context),
          ],
        ),
      ),
    );
  }
}
