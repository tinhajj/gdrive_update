import 'package:gdrive_update/gdrive_updater.dart';
import 'dart:io';

main() async {
  var config = File('bin/credentials.json');
  // Put the whole file in a single string.
  var contents = await config.readAsString();

  GDriveUpdater driveUpdater = new GDriveUpdater(contents);
  await driveUpdater.init();

  Map results = new Map();
  driveUpdater.queueSearch("rarr", results);
  driveUpdater.queueSearch("man", results);
  driveUpdater.queueSearch("fat", results);
  await driveUpdater.processJobs();

  results.forEach((key, value) {
    for (var file in value) {
      print(file.name);
    }
  });

  driveUpdater.close();
}
