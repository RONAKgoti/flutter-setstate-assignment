import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creative setState Assignment',
      home: const CreativeCounterPage(),
    );
  }
}

class CreativeCounterPage extends StatefulWidget {
  const CreativeCounterPage({super.key});

  @override
  State<CreativeCounterPage> createState() => _CreativeCounterPageState();
}

class _CreativeCounterPageState extends State<CreativeCounterPage> {
  int counter = 0;
  Color backgroundColor = Colors.white;
  double boxRadius = 20;

  final Random random = Random();

  String getMoodEmoji() {
    if (counter <= 0) {
      return '😐';
    } else if (counter <= 3) {
      return '🙂';
    } else if (counter <= 6) {
      return '😄';
    } else {
      return '🤩';
    }
  }

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void incrementCounter() {
    setState(() {
      counter++;
      backgroundColor = getRandomColor();

      if (counter % 3 == 0) {
        boxRadius = 100;
      } else if (counter % 2 == 0) {
        boxRadius = 0;
      } else {
        boxRadius = 20;
      }
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
      backgroundColor = getRandomColor();

      if (counter % 3 == 0) {
        boxRadius = 100;
      } else if (counter % 2 == 0) {
        boxRadius = 0;
      } else {
        boxRadius = 20;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      backgroundColor = Colors.white;
      boxRadius = 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Creative Use of setState()'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Interactive Counter with a Twist',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Text(getMoodEmoji(), style: const TextStyle(fontSize: 60)),
              const SizedBox(height: 10),

              Text(
                'Counter: $counter',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 25),

              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(boxRadius),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Tap Me',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: decrementCounter,
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: incrementCounter,
                    child: const Text('+'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: resetCounter,
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
