import 'package:gdrive_update/gdrive_update.dart';
import 'dart:io';

main() async {
  var config = File('bin/credentials.json');
  var contents;

  // Put the whole file in a single string.
  contents = await config.readAsString();

  var drive_updater = new GDriveUpdate(contents);
  await drive_updater.createClient();
  drive_updater.getFiles();
}
