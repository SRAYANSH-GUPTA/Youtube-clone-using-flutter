import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row( // Change to Row to properly structure the title
              children: [
                Image.asset('assets/logo.jpg', width: 50, height: 50),
                const SizedBox(width: 8), // Optional spacing
                const Text("Premium", style: TextStyle(color: Colors.white)),
              ],
            ),
            Image.asset('assets/chromecast.jpg', width: 50, height: 50),
            Image.asset('assets/bell.jpg', width: 50, height: 50),
            const Icon(Icons.search_outlined, color: Colors.white, size: 24.0),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  child: Text("News"),
                  onPressed: ()
                  {
                    print('pressed');
                  },
                ),ElevatedButton(
                  child: Text("Auditions"),
                  onPressed: ()
                  {
                    print('pressed');
                  },
                ),ElevatedButton(
                  child: Text("Podcasts"),
                  onPressed: ()
                  {
                    print('pressed');
                  },
                ),ElevatedButton(
                  child: Text("Salman Khan"),
                  onPressed: ()
                  {
                    print('pressed');
                  },
                )
              ],
            ),
            
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      
    );
  }
}
