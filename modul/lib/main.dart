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
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
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
  final String subtitle;
  final String description1;
  final String description2;
  final String description3;
  final int price;
  final String imageUrl;

  CardData({
    required this.title,
    required this.subtitle,
    required this.description1,
    required this.description2,
    required this.description3,
    required this.price,
    required this.imageUrl,
  });
}

final List<CardData> cardDataList = [
  CardData(
    title: 'Microsoft',
    subtitle: 'Surface Laptop 4 15"',
    description1: '15 inch screen',
    description2: 'AMD Ryzen 7',
    description3: '32gb of RAM',
    price: 333,
    imageUrl: 'https://content.rozetka.com.ua/goods/images/big/269608304.jpg',
  ),
  CardData(
    title: 'Microsoft',
    subtitle: 'Surface Laptop 4 15"',
    description1: '15 inch screen',
    description2: 'AMD Ryzen 7',
    description3: '32gb of RAM',
    price: 400,
    imageUrl: 'https://content.rozetka.com.ua/goods/images/big/321938773.jpg',
  ),
  CardData(
    title: 'Microsoft',
    subtitle: 'Surface Laptop 4 15"',
    description1: '15 inch screen',
    description2: 'AMD Ryzen 7',
    description3: '32gb of RAM',
    price: 600,
    imageUrl: 'https://content1.rozetka.com.ua/goods/images/big/144249716.jpg',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _previousCard,
                icon: Icon(Icons.arrow_back),
              ),
              Container(
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                          title: new Row(
                            children: <Widget>[
                              new Text(
                                cardDataList[_currentIndex].title,
                                style: new TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25.0),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          subtitle: new Row(
                            children: <Widget>[
                              Text(cardDataList[_currentIndex].subtitle),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )),
                      Image.network(cardDataList[_currentIndex].imageUrl,
                          width: 300, height: 300, fit: BoxFit.scaleDown),
                      ListTile(
                        title: Text(
                          "Characteristics",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(children: [
                          Row(children: [
                            Text(
                              "\u2022",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                cardDataList[_currentIndex].description1,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ]),
                          Row(children: [
                            Text(
                              "\u2022",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                cardDataList[_currentIndex].description2,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ]),
                          Row(children: [
                            Text(
                              "\u2022",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                cardDataList[_currentIndex].description3,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ]),
                          Text("Price:${cardDataList[_currentIndex].price}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ))
                        ]),
                      ),
                      ElevatedButton(
                        onPressed: _nextCard,
                        child: new Text("Add to Cart"),
                      )
                    ],
                  ),
                  color: Color.fromARGB(255, 211, 211, 211),
                ),
              ),
              IconButton(
                onPressed: _nextCard,
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
