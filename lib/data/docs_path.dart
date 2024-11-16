import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class DocsPath {
  late Directory docsDirectory;
  late Directory workoutsDir;

  static final DocsPath _docsPathInstance = DocsPath._();

  factory DocsPath() {
    return _docsPathInstance;
  }

  DocsPath._() {
    setupDirectoriesIfNecessary();
  }

  // DocsPath._() {
  //   if (_docsPathInstance == null) {
  //     setupDirectoriesIfNecessary();
  //     _docsPathInstance = this;
  //   }
  // }

  // Future<DocsPath> instance() async {
  //   return _docsPathInstance!;
  // }

// Note: this method will also work for updates, as it will overwrite it if it already exists 
  Future<void> writeJsonData(Map<String, dynamic> json, String uniqueFileName) async {
    // final Directory docsDirectory = await getApplicationDocumentsDirectory();
    // final Directory workoutsDir = Directory('${docsDirectory.path}/workouts');

    // Really should create a directory inside the docsDirectory - a workouts directory
    await workoutsDir.create();
    File newWorkout = File('${workoutsDir.absolute}/$uniqueFileName.json');
    await newWorkout.create();
    var sink = newWorkout.openWrite();
    sink.write(json);
    await sink.flush();
    await sink.close();
  }
  

  Future<Map<String, String>> getJsonData() async {
    // final Directory docsDirectory = await getApplicationDocumentsDirectory();
    // final Directory workoutsDir = Directory('${docsDirectory.path}/workouts');
    if (!(await workoutsDir.exists())) {
      return {};
    }
    Stream<FileSystemEntity> files = workoutsDir.list();
    Map<String, String> stringFiles = {};
    files.forEach((file) async {
      if (file is File && p.extension(file.path) == '.json') {
        String fileString = await file.readAsString();
        stringFiles[p.basename(file.path)] = fileString;
      }
    });
    return stringFiles;
  }

  Future<bool> deleteJsonData(String fileName) async {
    if (!(await workoutsDir.exists())) {
      return false;
    }
    Stream<FileSystemEntity> files = workoutsDir.list();
    File file = await files.firstWhere((el) => el is File && (p.basename(el.path) == fileName) || (p.basename(el.path) == '$fileName.json')) as File;
    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }



  Future<void> setupDirectoriesIfNecessary() async {
    docsDirectory = await getApplicationDocumentsDirectory();
    await docsDirectory.create();
    workoutsDir = Directory('${docsDirectory.path}/workouts');
    await workoutsDir.create();
  }
}