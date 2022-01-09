import 'package:fg_demo/controllers/notes_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notesProvider = ChangeNotifierProvider<NotesController>((ref) => NotesController());