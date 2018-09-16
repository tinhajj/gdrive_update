import 'package:test/test.dart';
import 'package:gdrive_update/src/file_comparer.dart';
import 'package:gdrive_update/src/change.dart';

void main() {
  test("Processes same files correctly", () {
    FileComparer fc = new FileComparer.bare();

    fc.file1 = ["movie.mkv"];
    fc.file2 = ["movie.mkv"];

    List<Change> c1 = fc.process();
    List<Change> c2 = [new Same("movie.mkv")];

    expect(c1, equals(c2));
  });

  test("Processes all different files correctly", () {
    FileComparer fc = new FileComparer.bare();

    fc.file1 = ["image.jpg"];
    fc.file2 = ["text.txt"];

    List<Change> c1 = fc.process();
    List<Change> c2 = [new Update("image.jpg", "text.txt")];

    expect(c1, equals(c2));
  });

  test("Processes deleted files correctly", () {
    FileComparer fc = new FileComparer.bare();

    fc.file1 = ["image.jpg"];
    fc.file2 = ["*text.txt"];

    List<Change> c1 = fc.process();
    List<Change> c2 = [new Delete("image.jpg")];

    expect(c1, equals(c2));
  });

  test("Processes a mixing of files correctly", () {
    FileComparer fc = new FileComparer.bare();

    fc.file1 = ["image.jpg", "movie.mkv", "show.wav"];
    fc.file2 = ["*text.txt", "movie.mkv", "new_show.wav"];

    List<Change> c1 = fc.process();
    List<Change> c2 = [
      new Delete("image.jpg"),
      new Same("movie.mkv"),
      new Update("show.wav", "new_show.wav"),
    ];

    expect(c1, equals(c2));
  });
}
