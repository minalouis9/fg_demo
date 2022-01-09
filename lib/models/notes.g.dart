// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotesModel _$$_NotesModelFromJson(Map<String, dynamic> json) =>
    _$_NotesModel(
      id: json['id'] as int,
      title: json['title'] as String,
      picture: json['picture'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$$_NotesModelToJson(_$_NotesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'picture': instance.picture,
      'description': instance.description,
      'date': instance.date,
      'status': instance.status,
    };
