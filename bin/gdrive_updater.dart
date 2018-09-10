import 'package:gdrive_update/gdrive_updater.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'dart:io';

main() async {
  var config = File('bin/credentials.json');
  // Put the whole file in a single string.
  var contents = await config.readAsString();

  GDriveUpdater driveUpdater = new GDriveUpdater(contents);
  await driveUpdater.init();

  var files = await driveUpdater.search("rar");

  print("Before Update");
  for (var file in files) {
    print(file.name);
    print(file.id);
  }

  driveUpdater.updateName(files[0].id, 'rarrrr');

  driveUpdater.close();
}
