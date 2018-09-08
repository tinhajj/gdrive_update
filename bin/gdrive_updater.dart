import 'package:gdrive_update/gdrive_updater.dart';
import 'dart:io';

main() async {
  var config = File('bin/credentials.json');
  // Put the whole file in a single string.
  var contents = await config.readAsString();

  GDriveUpdater driveUpdater = new GDriveUpdater(contents);
  await driveUpdater.init();

  var files = await driveUpdater.search("Man of Tai");
  for (var file in files) {
    print(file.name);
  }

  driveUpdater.close();
}
