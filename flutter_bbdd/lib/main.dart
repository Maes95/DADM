import 'package:flutter/material.dart';

import 'Character.dart';

void main() async {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> characters = [
    Character(name: "Rick Sánchez", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
    Character(name: "Morty Smith", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
    Character(name: "Summer Smith", image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty Characters'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  for (var character in characters)
                    CharacterWidget(
                      character: character,
                    )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget(
      {super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              child: Ink.image(
                image: Image.network(character.image).image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  character.name,
                  style: const TextStyle(fontSize: 32, color: Colors.cyan),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
