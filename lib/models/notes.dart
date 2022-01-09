import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

// 2. Declare this:
part 'notes.freezed.dart';
part 'notes.g.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
@immutable
class NotesModel with _$NotesModel {
  const factory NotesModel(
      {required int id,
      required String title,
      required String picture,
      required String description,
      required String date,
      required bool status}) = _NotesModel;

  factory NotesModel.fromJson(Map<String, dynamic> json) =>
      _$NotesModelFromJson(json);
}
