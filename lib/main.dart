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
    return Scaffold(backgroundColor: Colors.black,
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
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
              },
              child: Image.asset('assets/chromecast.jpg', width: 50, height: 50),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
              },
              child: Image.asset('assets/bell.jpg', width: 50, height: 50),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
              },
              child: const Icon(Icons.search_outlined, color: Colors.white, size: 24.0),
            ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Auditions"),
                  onPressed: () {
                    print('Auditions pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Podcasts"),
                  onPressed: () {
                    print('Podcasts pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                  },
                ),
                ElevatedButton(
                  child: const Text("Salman Khan"),
                  onPressed: () {
                    print('Salman Khan pressed');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoLayout()));
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
      bottomNavigationBar: BottomNavigationBar(
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex, // Keep track of the selected index
        onTap: (int index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlankPage()), // Always navigate to BlankPage
          );
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
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
        title: const Text("Blank Page"),
      ),
      body: const Center(child: Text("This is the second route")),
    );
  }
}

class VideoLayout extends StatelessWidget {
  const VideoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Layout"),
      ),
      body: const Center(child: Text("This is the third route")),
    );
  }
}
