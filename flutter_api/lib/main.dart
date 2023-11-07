import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Character.dart';

Future<List<Character>> fetchCharacters() async {
  final response =
  await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));
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

  @override
  void initState() {
    super.initState();
    charactersFuture = fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rick and Morty Characters'),
        ),
        body: FutureBuilder<List<Character>>(
          future: charactersFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Character character = snapshot.data![index];
                  return Text(character.name);
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
    );
  }
}
