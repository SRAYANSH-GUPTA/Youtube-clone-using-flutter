import 'package:flutter/material.dart';


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
  var content = ['Video 1', 'Video 2', 'Video 3', 'Video 4', 'Video 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text("News"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text("Auditions"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text("Podcasts"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text("Salman Khan"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoLayout()));
                    },
                    child: Column(
                      children: [
                        Image.asset('assets/pic${index + 1}.jpg'),
                        Text(content[index], style: const TextStyle(color: Colors.white)),
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

         onTap: (int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BlankPage()), 
    );
  },
        backgroundColor: Colors.black, 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
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
        backgroundColor: Colors.black,
      ),
      body: const Center(child: Text("This is the second route", style: TextStyle(color: Colors.white))),
    );
  }
}

class VideoLayout extends StatelessWidget {
  const VideoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Video Title', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey,
            child: (Image.asset('assets/video.jpg')
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("The REAL Life & Times of Krishna- Nilesh Oak Returns | Scientific",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '1.2M views 8 days ago History - The Ramveer Show ...more',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ), const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'BeerBiceps',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(height: 8),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ActionButton(icon: Icons.thumb_up_alt, label: 'Like'),
                _ActionButton(icon: Icons.comment, label: 'Comment'),
                _ActionButton(icon: Icons.share, label: 'Share'),
                _ActionButton(icon: Icons.save_alt, label: 'Save'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'This is a brief description of the video. It provides an overview of what the video is about.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
