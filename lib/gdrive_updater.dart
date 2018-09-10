library gdrive_update;

import 'package:googleapis/drive/v3.dart';
import 'package:gdrive_update/src/gdrive.dart';
import 'package:gdrive_update/src/job.dart';
import 'dart:async';

class GDriveUpdater extends GDrive {
  List<Job> jobs = new List();

  GDriveUpdater(String json) : super(json);

  Future<File> updateName(String fileID, String name) async {
    File patchFile = new File()..name = "name";
    return await super.update(patchFile, fileID);
  }

  processJobs() {}
}
