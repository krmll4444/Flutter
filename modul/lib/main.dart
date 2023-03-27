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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'App'),
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
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 255, 246),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CardSlider(),
            ),
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String description;
  final String imageUrl;

  CardData(
      {required this.title, required this.description, required this.imageUrl});
}

final List<CardData> cardDataList = [
  CardData(
    title: 'PHP',
    description:
        'PHP is a popular open-source server-side scripting language that was originally designed for web development but has since been used for a wide range of programming tasks. It was created by Rasmus Lerdorf in 1994 and has since been developed by a large community of contributors.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/PHP-logo.svg/1200px-PHP-logo.svg.png',
  ),
  CardData(
    title: 'Ruby',
    description:
        'Ruby is a high-level, dynamic, object-oriented programming language that was designed and developed in Japan in the mid-1990s by Yukihiro "Matz" Matsumoto. It is a general-purpose language that is widely used for web development, scripting, prototyping, and building desktop applications.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1200px-Ruby_logo.svg.png',
  ),
  CardData(
    title: 'Java',
    description:
        'Java is a general-purpose, high-level programming language that was first released in 1995 by Sun Microsystems. It is designed to be platform-independent, meaning that code written in Java can run on any platform that has a Java Virtual Machine (JVM) installed.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/ru/thumb/3/39/Java_logo.svg/1200px-Java_logo.svg.png',
  ),
  CardData(
    title: 'Python',
    description:
        'Python is a high-level, interpreted programming language that was first released in 1991 by Guido van Rossum. It has since become one of the most popular programming languages in the world, known for its simplicity, readability, and ease of use.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1200px-Python-logo-notext.svg.png',
  ),
];

class CardSlider extends StatefulWidget {
  @override
  _CardSliderState createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  int _currentIndex = 0;

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % cardDataList.length;
    });
  }

  void _previousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + cardDataList.length) % cardDataList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 600,
            width: 550,
            decoration: BoxDecoration(
              color: Color(0xFF18A2A5).withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                children: [
                  Image.network(cardDataList[_currentIndex].imageUrl,
                      width: 500, height: 500, fit: BoxFit.scaleDown),
                  ListTile(
                    title: Text(
                      cardDataList[_currentIndex].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(cardDataList[_currentIndex].description),
                  ),
                ],
              ),
              color: Color(0xFFB3E2D6),
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _previousCard,
                child: Icon(Icons.arrow_back),
              ),
              ElevatedButton(
                onPressed: _nextCard,
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
