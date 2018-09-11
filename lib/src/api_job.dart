import 'package:gdrive_update/src/job.dart';

class APIJob extends Job {
  String operation;
  String fileID;
  String fileName;

  APIJob(String this.operation, String this.fileID, Function task)
      : super(task) {}
}
