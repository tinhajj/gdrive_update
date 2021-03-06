library gdrive_update;

import 'package:gdrive_update/src/gdrive.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:gdrive_update/src/api_job.dart';

class GDriveUpdater extends GDrive {
  List<APIJob> jobs = new List();
  String fileExtension;

  GDriveUpdater(String json) : super(json);

  // A string to append to file searches & files updates
  GDriveUpdater.withFileExtension(String json, String this.fileExtension)
      : super(json);

  void queueSearchFiles(String name, Map results) {
    if (fileExtension != null) {
      name += fileExtension;
    }

    queueSearch(name, results, "files");
  }

  void queueSearchFolders(String name, Map results) {
    queueSearch(name, results, "folders");
  }

  void queueSearch(String name, Map results, [String type]) {
    APIJob job = new APIJob.search("search", () async {
      List<File> fileList = await search(name, type);
      results[name] = fileList;
    });
    jobs.add(job);
  }

  void queueUpdate(String fileID, String name) {
    if (fileExtension != null) {
      name += fileExtension;
    }

    APIJob job = new APIJob(
        name, "update", fileID, (fileID, name) => updateName(fileID, name));
    jobs.add(job);
  }

  void queueDelete(String fileID, String name) {
    APIJob job = new APIJob(name, "delete", fileID, (fileID) => delete(fileID));
    jobs.add(job);
  }

  processJobs() async {
    for (APIJob job in jobs) {
      await job.run();
    }
  }
}
