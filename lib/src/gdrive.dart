import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class GDrive {
  var _drive;
  var _credentials;
  static const _SCOPES = const [DriveApi.DriveReadonlyScope];

  GDrive(String json) {
    _credentials = new ServiceAccountCredentials.fromJson(json);
  }

  GDrive.fromFile(String fileName) {
    GDrive(fileName);
  }

  init() async {
    var client = await clientViaServiceAccount(_credentials, _SCOPES);
    _drive = new DriveApi(client);
    _drive.comments;
  }
}
