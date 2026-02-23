import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // set counter value
  int _counter = 0;

  Color _getStatusColor() {
    if (_counter == 0) {
      return Colors.red;
    } else if (_counter > 0 && _counter <= 50) {
      return const Color.fromARGB(255, 255, 193, 59);
    } else {
      return Colors.green;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rocket Launch Controller'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: _getStatusColor(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _counter == 100 ? 'LIFTOFF!' : '$_counter',
                    style: const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter < 100) {
                  _counter ++;
                }
              });
            },
            child: const Text('Ignite'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_counter > 0) {
                  _counter --;
                }
              });
            },
            child: const Text('Decrement'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter = 0;
              });
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
