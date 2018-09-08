import 'package:gdrive_update/gdrive_updater.dart';
import 'dart:io';

main() async {
  var config = File('bin/credentials.json');
  // Put the whole file in a single string.
  var contents = await config.readAsString();

  GDriveUpdater driveUpdater = new GDriveUpdater(contents);
  await driveUpdater.init();
  print(await driveUpdater.files());
  driveUpdater.close();
}
