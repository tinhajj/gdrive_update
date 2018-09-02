library gdrive_update;

import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class GDriveUpdate {
  const _SCOPES = const [DriveApi.DriveReadonlyScope];
  var _credentials;
  var _drive;

  GDriveUpdate(String json) {
    _credentials = new ServiceAccountCredentials.fromJson(json);
  }

  DriveApi createClient() async {
    var client = await clientViaServiceAccount(_credentials, _SCOPES);
    _drive = new DriveApi(client);

    return _drive;
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
