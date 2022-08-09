import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:wordddle/domain/models/user_stats.dart';

class FileHandler {
  // TODO use get_it to generate this singleton

  // Makes this a singleton class, as we want only want a single
  // instance of this object for the whole application
  FileHandler._privateConstructor();
  static final FileHandler instance = FileHandler._privateConstructor();

  static File? _file;
  static final _fileName = 'ws.txt';

  // Get the data file
  Future<File> get file async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  // Inititalize file
  Future<File> _initFile() async {
    final _directory = await getApplicationDocumentsDirectory();
    final _path = _directory.path;
    return File('$_path/$_fileName');
  }

  Future<UserStats?> readStats() async {
    final File fl = await file;
    final _content = await fl.readAsString();
    final Map<String, dynamic> _jsonData = jsonDecode(_content);

    return _jsonData.isEmpty ? null : UserStats.fromJson(_jsonData);
  }

  Future<void> writeStats(UserStats stats) async {
    final File fl = await file;

    final Map<String, dynamic> _statsJson = stats.toJson();

    await fl.writeAsString(jsonEncode(_statsJson));
  }

  Future<void> deleteStats(UserStats stats) async {
    final _directory = await getApplicationDocumentsDirectory();

    await _directory.delete(recursive: true);
  }
}
