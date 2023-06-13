import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MockData {
  static final instance = MockData();
  final _jsonDir = '/assets/stubs';
  final _jsonExtension = '.json';

  MockData();

  Future<dynamic> getMockData(RequestOptions options) async {
    final response = await retrieve(options.path);
    return response;
  }

  Future<dynamic> retrieve(String path) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final resourcePath = directory.path + _jsonDir + path + _jsonExtension;

    try {
      final File file = File("/data/data/com.example.medical_consultation_app/app_flutter/assets/stubs/api/appointments.json");
      final data = await file.readAsBytes();

      final map = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      return map;
    } catch (e) {
      throw "No Data found.";
    }
  }

  Future<void> bootStrap() async {
    List<String> files = await _getStubFiles();
    final Directory directory = await getApplicationDocumentsDirectory();
    for (String path in files) {
      final File file = File('${directory.path}/$path');
      bool exists = await file.exists();
      if (exists) {
        continue;
      }
      final response = await fetchFileDataFromBundle(path);
      _save(response, path);
    }
  }

  Future<List<String>> _getStubFiles() async {
    var assets = await rootBundle.loadString('AssetManifest.json');
    List<String> stubFiles = [];
    try {
      Map data = json.decode(assets);
      stubFiles = data.keys.where((element) => element.endsWith(".json")).map((e) => e.toString()).toList();
    } catch (e) {
      debugPrint('rootBundle error: ${e.toString()}');
    }
    return Future(() => stubFiles);
  }

  Future<String> fetchFileDataFromBundle(String resourcePath) async {
    try {
      final data = await rootBundle.load(resourcePath);
      final response = utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      );
      return response;
    } catch (e) {
      debugPrint('rootBundle error: ${e.toString()}');
      return "No Data found or you forgot to add path to pubspec.yaml under assets.";
    }
  }

  void _save(String text, String filePath, {bool overwrite = false}) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File(directory.path + (filePath.startsWith("/") ? filePath : "/$filePath"));
    final Directory appDocDirFolder = file.parent;
    debugPrint("_save: ${file.absolute.toString()}");
    if (!await appDocDirFolder.exists() || overwrite) {
      await appDocDirFolder.create(recursive: true);
    } else {
      // debugPrint("Path ${appDocDirFolder.path}");
    }
    try {
      File fileName = await file.writeAsString(text);
      debugPrint("fileName: ${fileName.path}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
