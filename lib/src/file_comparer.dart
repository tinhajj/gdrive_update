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

    List<Change> changes = new List();

    if (file1.length != file2.length) {
      throw ("Files do not have equal number of lines");
    }

    if (file1.length <= 0) {
      throw ("Files have no contents");
    }

    for (var i = 0; i < file1.length; i++) {
      var originalLine = file1[i];
      var newLine = file2[i];

      Change c;

      if (newLine.startsWith("*")) {
        c = new Delete(originalLine);
      } else if (originalLine == newLine) {
        c = new Same(originalLine);
      } else {
        c = new Update(originalLine, newLine);
      }

      changes.add(c);
    }

    return changes;
  }
}
