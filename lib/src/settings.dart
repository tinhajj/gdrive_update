import 'package:args/args.dart';

class Settings {
  static String credentialsFile, originalFile, newFile;
  static bool testMode;
  static bool help;

  static void processArgs(List<String> args) {
    ArgParser parser = new ArgParser();
    parser.addFlag('test', defaultsTo: false);
    parser.addFlag('help', defaultsTo: false);

    ArgResults results = parser.parse(args);

    if (results.rest.length < 3) {
      throw("Missing file arguments and/or credentials file");
    }

    credentialsFile = results.rest[0];
    originalFile = results.rest[1];
    newFile = results.rest[2];
    testMode = results['test'];
    help = results['help'];
  }
}