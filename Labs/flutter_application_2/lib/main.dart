import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isGrey = false;
  String _name = '';
  double _age = 0;
  String _city = 'Ужгород';
  final List<String> _cities = [
    'Ужгород',
    'Мукачево',
    'Київ',
    'Львів',
    'Одеса',
    'Харків',
    'Суми',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: _isGrey ? Colors.grey[300] : Colors.white,
        appBar: AppBar(
          title: const Text('Lab 2'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Switch(
                  value: _isGrey,
                  onChanged: (value) {
                    setState(() {
                      _isGrey = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Введіть своє ім\'я...',
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Slider(
                value: _age,
                min: 0,
                max: 100,
                divisions: 100,
                label: _age.toString(),
                onChanged: (value) {
                  setState(() {
                    _age = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: _city,
                items: _cities.map((String city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _city = value.toString();
                  });
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                  child: const Text('Проглянути'),
                  onPressed: () => _dialogBuilder(context)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Ваше ім\'я: $_name\n'
            'Ваш вік: ${_age.toInt()}\n'
            'Ви народились в: $_city',
          ),
          actions: [
            TextButton(
              child: const Text('Закрити'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
