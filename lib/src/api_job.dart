import 'package:gdrive_update/src/job.dart';

class APIJob extends Job {
  String operation;
  String fileID;
  String fileName;

  APIJob.search(String this.operation, Function task) : super(task) {}

  APIJob(String this.fileName, String this.operation, String this.fileID,
      Function task)
      : super(task) {}

  String toString() {
    String output = "";
    output += "Op: $operation FileID: $fileID";

    if (fileName != null) {
      output += " Name: $fileName";
    }

    return output;
  }
}
