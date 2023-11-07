import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'Character.dart';

Future<List<Character>> fetchCharacters(int page) async {
  final response =
  await http.get(Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));
  await Future.delayed(const Duration(seconds: 1));
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body)['results'];
    return List<Character>.from(l.map((item) => Character.fromJson(item)));
  } else {
    throw Exception('Failed to load Character');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Future<List<Character>> charactersFuture;
  int pageCount = 1;

  @override
  void initState() {
    super.initState();
    charactersFuture = fetchCharacters(pageCount);
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(onPressed: ()=>{
                    setState(() {
                      pageCount+=1;
                      charactersFuture = fetchCharacters(pageCount);
                    })
                  }, child: const Text("Next page", style: TextStyle(fontSize: 30))),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Character>>(
                  future: charactersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Character character = snapshot.data![index];
                          return CharacterWidget(character: character);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    super.key,
    required this.character,
  });

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
                  style: const TextStyle(fontFamily: 'RickAndMorty', fontSize: 40, color: Colors.cyan),
                  //style: GoogleFonts.pacifico(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
