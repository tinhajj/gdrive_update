import 'dart:io';
import 'package:gdrive_update/src/change.dart';
import 'dart:convert';

class FileComparer {
  List<String> file1, file2;
  String path1, path2;

  FileComparer.bare() {}

  FileComparer(String this.path1, this.path2) {}

  loadFiles() async {
    file1 = await new File(path1)
        .openRead()
        .transform(utf8.decoder)
        .transform(new LineSplitter())
        .toList();

    file2 = await new File(path2)
        .openRead()
        .transform(utf8.decoder)
        .transform(new LineSplitter())
        .toList();
  }

  List<Change> process() {
    // I wanted to be able to loop through both files at the same time, but I
    // am not sure of an easy way to do that at the moment.  So we have to read
    // in both files into memory.

    List<Change> changes;

    if (file1.length != file2.length) {
      throw ("Files do not have equal number of lines");
    }

    if (file1.length <= 0) {
      throw ("Files have no contents");
    }

    for (var i = 0; i < file1.length; i++) {
      if (file1[0] == file2[0]) {
        Change c = new Change(ChangeType.nochange, file1[0]);
        changes.add(c);
      }
    }

    return changes;
  }
}
