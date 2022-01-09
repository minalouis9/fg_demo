import 'package:path_provider/path_provider.dart';

class LocalFileHelper{
  static Future<String> getApplicationPath() async {
    return await getApplicationDocumentsDirectory().then((value) => value.path);
  }

  static Future readFile() async {

  }
}