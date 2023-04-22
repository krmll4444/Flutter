import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 1'),
        ),
        body: Column(
          children: [
            const MyCard(
              image:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/70px-Unofficial_JavaScript_logo_2.svg.png',
              title: 'JS',
              subtitle:
                  'JavaScript, often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.',
              color: Colors.white,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.red,
                    child: const MyCard(
                      image:
                          'https://www.ruby-lang.org/images/header-ruby-logo.png',
                      title: 'Ruby',
                      subtitle:
                          'A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.',
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 96, 33, 243),
                    child: const MyCard(
                      image:
                          'https://www.php.net/images/logos/new-php-logo.png',
                      title: 'PHP',
                      subtitle:
                          'A popular general-purpose scripting language that is especially suited to web development. Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.',
                      color: Color.fromARGB(255, 96, 33, 243),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final Color color;

  const MyCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: color,
      child: Column(
        children: [
          Image.network(
            image,
            width: 150,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
