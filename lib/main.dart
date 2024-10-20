import 'package:flutter/material.dart';

var array = [1, 2, 3, 4, 5];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'YouTube'),
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
  var content = ['jsbjsbg', 'jksbgjsg', 'skjbgs', 'sjkghusk', 'kjsbegs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/logo.jpg', width: 50, height: 50),
                const SizedBox(width: 8),
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
                  child: const Text("News"),
                  onPressed: () {
                    print('News pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BlankPage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Auditions"),
                  onPressed: () {
                    print('Auditions pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BlankPage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Podcasts"),
                  onPressed: () {
                    print('Podcasts pressed');
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BlankPage()),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Text("Salman Khan"),
                  onPressed: () {
                    print('Salman Khan pressed');
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BlankPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: array.length,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    onTap: ()
                    {
                        Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const videolayout()),
                    );
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/pic${index + 1}.jpg'),
                        Text(content[index]),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Black page"),
      ),
      body: const Center(child: Text("This is the second route")),
    );
  }
}
class videolayout extends StatelessWidget {
  const videolayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("video layout"),
      ),
      body: const Center(child: Text("This is the third route")),
    );
  }
}