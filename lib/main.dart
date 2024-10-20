import 'package:flutter/material.dart';

var content = [
  "INDIA'S GOT LATENT | EP 005 ft. @KunalKamra @AtulKhatriComedian",
  "OH HELLO! - A COMEDY SPECIAL BY RAHUL DUA | 2024",
  "COMEDIAN @SamayRainaOfficial cooks Biryani for Sahiba Bali | Wasting Samay |...",
  "Free API - Our open-source project got an upgrade"
];

var channel = ['Samay Raina', 'Rahul Dua', 'Zomato', 'Chai aur Code'];
var views = [
  '14M views  1 month ago',
  '730K views . 1 day ago',
  '5.1M views . 2 years ago',
  '11K views . 1 day ago'
];

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
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
            Row(
              children: [
                _buildIconButton(context, 'assets/chromecast.jpg'),
                _buildIconButton(context, 'assets/bell.jpg'),
                _buildIconButton(context, null, icon: Icons.search_outlined),
              ],
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
                _buildCategoryButton(context, "News"),
                _buildCategoryButton(context, "Auditions"),
                _buildCategoryButton(context, "Podcasts"),
                _buildCategoryButton(context, "Salman Khan"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoLayout(
                            data: index,
                            currentIndex: _currentIndex,
                            onItemTapped: _onItemTapped,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/pic${index + 1}.jpg'),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/pf.jpg'),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(content[index], style: const TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(channel[index], style: const TextStyle(color: Colors.white)),
                              Text(views[index], style: const TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
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
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Shorts'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
  onTap: _onItemTapped,
  currentIndex: _currentIndex,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.black,  // Explicitly set the background color
),
    );
  }

  Padding _buildCategoryButton(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
        },
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String? imagePath, {IconData? icon}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const BlankPage()));
      },
      child: imagePath != null
          ? Image.asset(imagePath, width: 50, height: 50)
          : Icon(icon, color: Colors.white, size: 24.0),
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
      body: const Center(
        child: Text("This is the second route", style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Shorts'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
  onTap: _onItemTapped,
  currentIndex: _currentIndex,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.black,  // Explicitly set the background color
),
    );
  }
}

class VideoLayout extends StatelessWidget {
  const VideoLayout({super.key, required this.data, required this.currentIndex, required this.onItemTapped});
  
  final int data;
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(content[data], style: const TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey,
            child: Image.asset('assets/pic${data + 1}.jpg'), // Corrected indexing for image
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              content[data],
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/pf.jpg'),
                ),
                const SizedBox(width: 8),
                Text(
                  channel[data],
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
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
              'Description...........................................................',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Shorts'),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
    BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
  onTap: _onItemTapped,
  currentIndex: _currentIndex,
  selectedItemColor: Colors.white,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.black,  // Explicitly set the background color
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
