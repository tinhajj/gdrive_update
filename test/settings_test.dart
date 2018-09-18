import 'package:test/test.dart';
import 'package:gdrive_update/src/settings.dart';

void main() {
  test("Processes arguments when they are correct", () {
    Settings.processArgs(["credentials", "file1", "file2"]);

    expect(Settings.credentialsFile, equals("credentials"));
    expect(Settings.originalFile, equals("file1"));
    expect(Settings.newFile, equals("file2"));
  });

  test("Throws error when not enough arguments", () {
    expect(() => Settings.processArgs(["credentials", "file1"]), throwsA("Missing file arguments and/or credentials file"));
  });
}
