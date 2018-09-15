import 'package:test/test.dart';
import 'package:gdrive_update/src/file_comparer.dart';
import 'package:gdrive_update/src/change.dart';

void main() {
  test("Processes files correctly", () {
    FileComparer fc = new FileComparer.bare();

    fc.file2 = ["movie.mkv"];
    fc.file2 = ["movie.mkv"];

    var c1 = new Change.bare();
    var c2 = new Change.bare();

    expect(c1, equals(c2));
  });
}
