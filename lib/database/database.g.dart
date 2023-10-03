// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CharacterfData extends DataClass implements Insertable<CharacterfData> {
  final int id;
  final String name;
  final String status;
  final String image;
  CharacterfData(
      {required this.id,
      required this.name,
      required this.status,
      required this.image});
  factory CharacterfData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CharacterfData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      status: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['image'] = Variable<String>(image);
    return map;
  }

  CharacterfCompanion toCompanion(bool nullToAbsent) {
    return CharacterfCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      image: Value(image),
    );
  }

  factory CharacterfData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterfData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'image': serializer.toJson<String>(image),
    };
  }

  CharacterfData copyWith(
          {int? id, String? name, String? status, String? image}) =>
      CharacterfData(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        image: image ?? this.image,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterfData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, status, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterfData &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.image == this.image);
}

class CharacterfCompanion extends UpdateCompanion<CharacterfData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> status;
  final Value<String> image;
  const CharacterfCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.image = const Value.absent(),
  });
  CharacterfCompanion.insert({
    required int id,
    required String name,
    required String status,
    required String image,
  })  : id = Value(id),
        name = Value(name),
        status = Value(status),
        image = Value(image);
  static Insertable<CharacterfData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (image != null) 'image': image,
    });
  }

  CharacterfCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? status,
      Value<String>? image}) {
    return CharacterfCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterfCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $CharacterfTable extends Characterf
    with TableInfo<$CharacterfTable, CharacterfData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterfTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String?> status = GeneratedColumn<String?>(
      'status', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, status, image];
  @override
  String get aliasedName => _alias ?? 'characterf';
  @override
  String get actualTableName => 'characterf';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterfData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CharacterfData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CharacterfData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CharacterfTable createAlias(String alias) {
    return $CharacterfTable(attachedDatabase, alias);
  }
}

abstract class _$AppDataBasess extends GeneratedDatabase {
  _$AppDataBasess(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CharacterfTable characterf = $CharacterfTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [characterf];
}
