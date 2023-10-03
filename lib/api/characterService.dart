import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_rick_and_morty/api/character.dart';

class CharacterService{
  static Future<List<Character>> queryCharacters(int page, int limit) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=${page}&limit=${limit}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final charactersData = jsonData['results'] as List<dynamic>;
      final characters = charactersData
          .map((characterData) => Character.fromJson(characterData))
          .toList();
      return characters;
    } else {
      throw Exception("Error al cargar los datos del personaje");
    }
  }

  static Future<Character> queryCharacter(int id) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/${id}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final character = Character.fromJson(jsonData);
      return character;
    } else {
      throw Exception("Error al cargar los datos del personaje");
    }
  }

}