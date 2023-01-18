import 'package:flutter/material.dart';
import 'package:flutter_dio/pages/list_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  List<String> titles = ["Notice", "Exam-Schedule", "Results"];
  List<String> urls = [
    "https://www.tuiost.edu.np/notice",
    "https://www.tuiost.edu.np/schedule",
    "https://www.tuiost.edu.np/result"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ListScreen(
                            url: urls[0],
                            pageTitle: titles[0],
                          ))));
            },
            child: Text(
              titles[0],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ListScreen(
                            url: urls[1],
                            pageTitle: titles[1],
                          ))));
            },
            child: Text(
              titles[1],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => ListScreen(
                            url: urls[2],
                            pageTitle: titles[2],
                          ))));
            },
            child: Text(
              titles[2],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ))
      ]),
    );
  }
}
