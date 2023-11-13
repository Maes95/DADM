import 'package:flutter/material.dart';
import 'package:prueba_bbdd/CharacterService.dart';

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
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    _getRefreshCharacters();
  }

  void _getRefreshCharacters() async {
    final data = await CharacterService.loadCharacters();
    setState(() {
      characters = data;
    });
  }
  // No copiar
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
                  // No copiar
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
