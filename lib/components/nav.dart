import 'package:flutter/material.dart';
import 'package:skillswedstrijd/pages/agenda.dart';
import 'package:skillswedstrijd/pages/contact.dart';
import 'package:skillswedstrijd/pages/homepage.dart';

NavigationBar getNav(BuildContext context) {
  return NavigationBar(
    destinations: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          icon: Icon(
            Icons.home,
            color: Color.fromRGBO(241, 241, 248, 1),
          )),
      IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Agenda()));
          },
          icon: Icon(
            Icons.calendar_month,
            color: Color.fromRGBO(241, 241, 248, 1),
          )),
      IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contact()));
          },
          icon: Icon(
            Icons.contact_mail,
            color: Color.fromRGBO(241, 241, 248, 1),
          )),
    ],
    backgroundColor: Color.fromRGBO(215, 164, 146, 1),
    overlayColor: WidgetStatePropertyAll(Color.fromRGBO(241, 241, 248, 1)),
  );
}
