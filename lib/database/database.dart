import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Characterf extends Table{
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().named('name')();
  TextColumn get status => text().named('status')();
  TextColumn get image => text().named('image')();
}

LazyDatabase abrirConexion(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dbCharacter.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Characterf])
class AppDataBasess extends _$AppDataBasess{
  AppDataBasess(NativeDatabase nativeDatabase): super(abrirConexion());
  @override
  int get schemaVersion => 1;

  Future<int> insertCharacter(CharacterfCompanion characterfCompanion) async{
    return await into(characterf).insert(characterfCompanion);
  }
  
  Future<List<CharacterfData>> getListado() async{
    return await select(characterf).get();
  }

  Future<int> deleteCharacter(int id) async{
    return await (delete(characterf)..where((tbl) => tbl.id.equals(id))).go();
  }

  
}