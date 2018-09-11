library gdrive_update;

import 'package:gdrive_update/src/gdrive.dart';
import 'package:gdrive_update/src/job.dart';

class GDriveUpdater extends GDrive {
  List<Job> jobs = new List();

  GDriveUpdater(String json) : super(json);

  void queueUpdate() {}

  void queueDelete() {}

  processJobs() {}
}
