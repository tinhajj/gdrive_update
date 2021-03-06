library gdrive_update;

import 'package:googleapis/drive/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:async';

class GDrive {
  AutoRefreshingAuthClient client;
  DriveApi driveAPI;
  FilesResourceApi fileAPI;

  static const String folderMime = "application/vnd.google-apps.folder";

  var _credentials;
  static const _SCOPES = const [DriveApi.DriveScope];

  GDrive(String json) {
    _credentials = new ServiceAccountCredentials.fromJson(json);
  }

  Future<void> init() async {
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

  Future<List<File>> search(String name, String type) async {
    // The drive is shared with us so we don't have to check if the file is
    // trashed
    FileList fileList;
    String query;

    if (type == "files") {
      query = "name contains '${name}' and mimeType != '$folderMime'";
    } else if (type == "folders") {
      query = "name contains '${name}' and mimeType = '$folderMime'";
    } else {
      query = "name contains '${name}'";
    }

    fileList = await fileAPI.list(q: query);
    return fileList.files;
  }

  Future<void> delete(String fileID) async {
    await fileAPI.delete(fileID);
    return;
  }

  Future<File> update(File file, String fileID) async {
    return await fileAPI.update(file, fileID);
  }

  Future<File> updateName(String fileID, String name) async {
    File patchFile = new File()..name = "name";
    return await update(patchFile, fileID);
  }
}
