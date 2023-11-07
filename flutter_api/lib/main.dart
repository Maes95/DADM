import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Character.dart';

void main() async{
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/'));
  if (response.statusCode == 200) {
    Iterable l = json.decode(response.body)['results'];
    var characters = List<Character>.from(l.map((item) => Character.fromJson(item)));
    characters.forEach((character) => print(character.name) );
  } else {
    throw Exception('Failed to load Character');
  }
}

