library gdrive_update;

import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:async';

class GDrive {
  AutoRefreshingAuthClient client;
  DriveApi driveAPI;
  FilesResourceApi fileAPI;

  var _credentials;
  static const _SCOPES = const [DriveApi.DriveReadonlyScope];

  GDrive(String json) {
    _credentials = new ServiceAccountCredentials.fromJson(json);
  }

  void init() async {
    client = await clientViaServiceAccount(_credentials, _SCOPES);
    driveAPI = new DriveApi(client);
    fileAPI = driveAPI.files;
  }

  void close() {
    client.close();
  }

  Future<Map<String, Object>> files() async {
    FileList fileList = await fileAPI.list();
    return fileList.toJson();
  }
}
