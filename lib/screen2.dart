import 'package:app_rick_and_morty/api/character.dart';
import 'package:app_rick_and_morty/database/database.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';

class screen2 extends StatefulWidget {
  const screen2({super.key});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {

  late Future<List<CharacterfData>> _characterFuture;

  @override
  void initState() {
    super.initState();
    _characterFuture = AppDataBasess(NativeDatabase.memory()).getListado();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de Personajes"),
        backgroundColor: Color.fromARGB(255, 135, 238, 70),
      ),
      body: FutureBuilder<List<CharacterfData>>(
        future: _characterFuture,
        builder: (context, snapshot){
          if (snapshot.hasData) {
             final characters = snapshot.data!;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  leading: Image.network(character.image),
                  title: Text(character.name),
                  subtitle: Text(character.status),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                       final database = AppDataBasess(NativeDatabase.memory());
                        final id = character.id;

                        database.deleteCharacter(id).then((rowsAffected) {
                          if (rowsAffected > 0) {
              
                            setState(() {
                              _characterFuture = AppDataBasess(NativeDatabase.memory()).getListado();
                            });
                          }
                        });
                    },
                  ),
                );
              }
            );
          }else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}