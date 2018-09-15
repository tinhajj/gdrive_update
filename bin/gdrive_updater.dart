import 'package:gdrive_update/gdrive_updater.dart';
import 'package:gdrive_update/src/file_comparer.dart';
import 'dart:io';

main() async {
  FileComparer file =
      new FileComparer("bin/gdrive_updater.dart", "bin/gdrive_updater.dart");
  await file.process();

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
