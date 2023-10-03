import 'package:app_rick_and_morty/api/character.dart';
import 'package:app_rick_and_morty/api/characterService.dart';
import 'package:app_rick_and_morty/database/database.dart';
import 'package:app_rick_and_morty/screen2.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as dr;

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {

  late Future<List<Character>> _characterFuture;

  late ScrollController _scrollController;

  void initState() {
    super.initState();
    _characterFuture = CharacterService.queryCharacters(1, 20);

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Comprueba si se ha alcanzado el final del scroll
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreCharacters();
    }
  }

  void _loadMoreCharacters() {
    _characterFuture.then((characters) {
      final currentPage = characters.length ~/ 20; // Calcula la página actual dividiendo la cantidad de animes entre 25
      CharacterService.queryCharacters(currentPage + 1, 20).then((newCharacters) {
        setState(() {
          characters.addAll(newCharacters); // Agrega los nuevos personajes a la lista existente
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final database = AppDataBasess(NativeDatabase.memory());

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.animation, 
              size: 30, 
              color: Colors.white, 
            ),
            SizedBox(width: 8), 
            Text(
              "Rick and Morty",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 135, 238, 70),
      ),
      body: FutureBuilder<List<Character>>(
        future: _characterFuture,
        builder:(context, snapshot){
          if (snapshot.hasData) {
             final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index){
                final character = characters[index];
                return ListTile(
                  leading: Image.network(character.image),
                  title: Text(character.name),
                  subtitle: Text(character.status),
                  trailing: ElevatedButton(
                    onPressed: () {
                      database.insertCharacter(
                        CharacterfCompanion(
                          id: dr.Value(character.id),
                          name: dr.Value(character.name),
                          status: dr.Value(character.status),
                          image: dr.Value(character.image),
                        )
                      ).then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => screen2()),
                        );
                      });
                      
                    },
                    child: Text("Add"),
                  ),
                );
              }
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}