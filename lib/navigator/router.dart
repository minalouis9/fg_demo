import 'dart:io';

import 'package:fg_demo/models/models_index.dart';
import 'package:fg_demo/navigator/paths.dart';
import 'package:fg_demo/screens/add_note_screen.dart';
import 'package:fg_demo/screens/edit_note_screen.dart';
import 'package:fg_demo/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.homeScreen:
        return _navigate(const HomeScreen());
      case RoutePaths.addNoteScreen:
        return _navigate(const AddNoteScreen());
      case RoutePaths.editNoteScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return _navigate(EditNoteScreen(note: args['note'] as NotesModel, index: args['index'] as int,));

      default:
        return _navigate(const HomeScreen());
    }
  }

  static _navigate(Widget widget) {
    if(Platform.isAndroid){
      return MaterialPageRoute(builder: (_) => widget);
    }else if(Platform.isIOS){
      return CupertinoPageRoute(builder: (_) => widget);
    }
  }
}