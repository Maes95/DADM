import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Character.dart';

class CharacterService {
  static Future<Database> db() async {
    WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
      join(await getDatabasesPath(), 'characters_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE Characters(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertCharacter(Character character) async {
    final connection = await db();

    await connection.insert(
      'Characters',
      character.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Character>> loadCharacters() async {
    final connection = await db();

    final List<Map<String, dynamic>> maps = await connection.query('Characters');

    return List.generate(maps.length, (i) {
      return Character(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        image: maps[i]['image'] as String,
      );
    });
  }

  static Future<void> deleteCharacter(int id) async {
    final connection = await db();

    await connection.delete(
      'Characters',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
