import 'package:gdrive_update/gdrive_updater.dart';
import 'package:gdrive_update/src/file_comparer.dart';
import 'package:gdrive_update/src/change.dart';
import 'package:gdrive_update/src/settings.dart';
import 'dart:io';

main(List<String> args) async {
  try {
    Settings.processArgs(args);
  } catch (e) {
    stderr.write("Bad arguments given, missing before/after files and/or credentials file");
    exit(2);
  }

  if (Settings.help) {
    print("Args\n  [credentials file] [old files] [new files]\nFlags\n  * Test (print changes w/o taking action)\n  * Help");
  }

  FileComparer file =
    new FileComparer(Settings.originalFile, Settings.newFile);
  await file.loadFiles();
  Iterable<Change> changes = await file.process();
  changes = changes.where( (Change change) => (change is Update || change is Delete) );

  if (Settings.testMode) {
    for (Change change in changes) {
      print("$change\n");
    }

    return;
  }

  /*
  var config = File('bin/credentials.json');
  // Put the whole file in a single string.
  var contents = await config.readAsString();

  GDriveUpdater driveUpdater =
      new GDriveUpdater.withFileExtension(contents, ".bin");
  await driveUpdater.init();

  Map<String, List> results = new Map();

  driveUpdater.queueSearchFiles("Jupiter.mkv", results);
  driveUpdater.queueSearchFiles("cat", results);
  driveUpdater.queueSearchFiles("man", results);
  await driveUpdater.processJobs();

  results.forEach((key, value) {
    for (var file in value) {
      print(file.name);
    }
  });

  driveUpdater.close();
  */
}
