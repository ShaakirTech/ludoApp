import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int playerCount = 5;
  int robertCount = 3;
  int wonPlayer = 0;
  int wonRober = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffef476f),
      appBar: AppBar(
        elevation: 22.0,
        centerTitle: true,
        backgroundColor: Color(0xffef476f),
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        title: Text("Ludo Game"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You : Won $wonPlayer",
                        style: TextStyle(fontSize: 26),
                      ),
                      SizedBox(
                        height: 22.0,
                      ),
                      Image.asset("images/dice$playerCount.png"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rob : Won $wonRober",
                        style: TextStyle(fontSize: 26.0),
                      ),
                      SizedBox(
                        height: 22.0,
                      ),
                      Image.asset("images/dice$robertCount.png"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.0,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                playerCount = Random().nextInt(6) + 1;
                robertCount = Random().nextInt(6) + 1;
                if (playerCount > robertCount) {
                  wonPlayer++;
                } else if (playerCount < robertCount) {
                  wonRober++;
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Start Game",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
