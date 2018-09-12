import 'package:gdrive_update/src/job.dart';

class APIJob extends Job {
  String operation;
  String fileID;

  APIJob.search(String this.operation, Function task) : super(task) {}

  APIJob(String this.operation, String this.fileID, Function task)
      : super(task) {}

  String toString() {
    return "Op: $operation FileID: $fileID";
  }
}
