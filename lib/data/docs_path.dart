import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

class DocsPath {
  Directory? docsDirectory;
  Directory? workoutsDir;

  static final DocsPath _docsPathInstance = DocsPath._();

  factory DocsPath() {
    return _docsPathInstance;
  }

  DocsPath._() {
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
    await setupDirectoriesIfNecessary();
    await workoutsDir!.create();
    
    File newWorkout = File(p.join(workoutsDir!.absolute.path, '$uniqueFileName.json')); // can't do it because the path ends with a ' weirdly
    await newWorkout.create();
    var sink = newWorkout.openWrite();
    // jsonEncode(json);
    sink.write(jsonEncode(json));
    await sink.flush();
    await sink.close();
  }
  

  Future<Map<String, String>> getJsonData() async {
    // final Directory docsDirectory = await getApplicationDocumentsDirectory();
    // final Directory workoutsDir = Directory('${docsDirectory.path}/workouts');
    await setupDirectoriesIfNecessary();
    print("Looking for workoutsDir at " + workoutsDir!.path);
    if (!(await workoutsDir!.exists())) {
      print('Looks like we cant findit');
      return {};
    }
    Stream<FileSystemEntity> files = workoutsDir!.list();
    Map<String, String> stringFiles = {};
    Iterable<FileSystemEntity> fileList = await files.toList();
    await Future.forEach(fileList, (file) async {
      // print('have a file');
      if (file is File && p.extension(file.path) == '.json') {
        String fileString = await file.readAsString();
        // print('file has a json extension and looks like $fileString');
        stringFiles[p.basename(file.path)] = fileString;
        // print('as we build stringFiles, its current size is ${stringFiles.length}');
      }
    });
    print('returning stringfiles of size ${stringFiles.length}');
    return stringFiles;
  }

  Future<bool> deleteJsonData(String fileName) async {
    await setupDirectoriesIfNecessary();
    if (!(await workoutsDir!.exists())) {
      return false;
    }
    Stream<FileSystemEntity> files = workoutsDir!.list();
    File file = await files.firstWhere((el) => el is File && (p.basename(el.path) == fileName) || (p.basename(el.path) == '$fileName.json')) as File;
    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }



  Future<void> setupDirectoriesIfNecessary() async {
    String path = '/assets/db';
    if (!kIsWeb) {
      print('NOT WEB');
      docsDirectory = await getApplicationDocumentsDirectory();
    } else {
      docsDirectory = Directory(path);
    }
    await docsDirectory!.create(recursive: true);
    workoutsDir = Directory('${docsDirectory!.path}/workouts');
    await workoutsDir!.create();
  }
}