import 'package:fg_demo/navigator/paths.dart';
import 'package:fg_demo/navigator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          title: 'Face Graph Demo',

          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: RoutePaths.homeScreen,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
