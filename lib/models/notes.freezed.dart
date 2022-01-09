// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) {
  return _NotesModel.fromJson(json);
}

/// @nodoc
class _$NotesModelTearOff {
  const _$NotesModelTearOff();

  _NotesModel call(
      {required int id,
      required String title,
      required String picture,
      required String description,
      required String date,
      required bool status}) {
    return _NotesModel(
      id: id,
      title: title,
      picture: picture,
      description: description,
      date: date,
      status: status,
    );
  }

  NotesModel fromJson(Map<String, Object?> json) {
    return NotesModel.fromJson(json);
  }
}

/// @nodoc
const $NotesModel = _$NotesModelTearOff();

/// @nodoc
mixin _$NotesModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotesModelCopyWith<NotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesModelCopyWith<$Res> {
  factory $NotesModelCopyWith(
          NotesModel value, $Res Function(NotesModel) then) =
      _$NotesModelCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String title,
      String picture,
      String description,
      String date,
      bool status});
}

/// @nodoc
class _$NotesModelCopyWithImpl<$Res> implements $NotesModelCopyWith<$Res> {
  _$NotesModelCopyWithImpl(this._value, this._then);

  final NotesModel _value;
  // ignore: unused_field
  final $Res Function(NotesModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? picture = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NotesModelCopyWith<$Res> implements $NotesModelCopyWith<$Res> {
  factory _$NotesModelCopyWith(
          _NotesModel value, $Res Function(_NotesModel) then) =
      __$NotesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String title,
      String picture,
      String description,
      String date,
      bool status});
}

/// @nodoc
class __$NotesModelCopyWithImpl<$Res> extends _$NotesModelCopyWithImpl<$Res>
    implements _$NotesModelCopyWith<$Res> {
  __$NotesModelCopyWithImpl(
      _NotesModel _value, $Res Function(_NotesModel) _then)
      : super(_value, (v) => _then(v as _NotesModel));

  @override
  _NotesModel get _value => super._value as _NotesModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? picture = freezed,
    Object? description = freezed,
    Object? date = freezed,
    Object? status = freezed,
  }) {
    return _then(_NotesModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotesModel implements _NotesModel {
  const _$_NotesModel(
      {required this.id,
      required this.title,
      required this.picture,
      required this.description,
      required this.date,
      required this.status});

  factory _$_NotesModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotesModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String picture;
  @override
  final String description;
  @override
  final String date;
  @override
  final bool status;

  @override
  String toString() {
    return 'NotesModel(id: $id, title: $title, picture: $picture, description: $description, date: $date, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotesModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, picture, description, date, status);

  @JsonKey(ignore: true)
  @override
  _$NotesModelCopyWith<_NotesModel> get copyWith =>
      __$NotesModelCopyWithImpl<_NotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotesModelToJson(this);
  }
}

abstract class _NotesModel implements NotesModel {
  const factory _NotesModel(
      {required int id,
      required String title,
      required String picture,
      required String description,
      required String date,
      required bool status}) = _$_NotesModel;

  factory _NotesModel.fromJson(Map<String, dynamic> json) =
      _$_NotesModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get picture;
  @override
  String get description;
  @override
  String get date;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$NotesModelCopyWith<_NotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
