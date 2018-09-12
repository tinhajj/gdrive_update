library gdrive_update;

import 'package:gdrive_update/src/gdrive.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:gdrive_update/src/api_job.dart';

class GDriveUpdater extends GDrive {
  List<APIJob> jobs = new List();

  GDriveUpdater(String json) : super(json);

  void queueSearch(String name, Map results) {
    APIJob job = new APIJob.search("search", () async {
      List<File> fileList = await search(name);
      results[name] = fileList;
    });
    jobs.add(job);
  }

  void queueUpdate(String fileID, String name) {
    APIJob job = new APIJob(
        "update", fileID, (fileID, name) => updateName(fileID, name));
    jobs.add(job);
  }

  void queueDelete(String fileID) {
    APIJob job = new APIJob("delete", fileID, (fileID) => delete(fileID));
    jobs.add(job);
  }

  processJobs() async {
    for (APIJob job in jobs) {
      await job.run();
    }
  }
}
