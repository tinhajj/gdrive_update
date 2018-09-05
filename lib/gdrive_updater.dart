library gdrive_update;

import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class GDriveUpdater {
  static const _SCOPES = const [DriveApi.DriveReadonlyScope];
  var _credentials;
  DriveApi _drive;

  GDriveUpdate(String json) {
    _credentials = new ServiceAccountCredentials.fromJson(json);
  }

  createClient() async {
    var client = await clientViaServiceAccount(_credentials, _SCOPES);
    _drive = new DriveApi(client);
  }

  getFiles() async {
    var list = await _drive.files
        .list(includeTeamDriveItems: true, supportsTeamDrives: true);
    var files = list.files;

    var incomplete = list.incompleteSearch;
    print(incomplete);

    for (var file in files) {
      print(file.createdTime);
    }
  }
}
