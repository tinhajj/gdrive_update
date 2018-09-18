abstract class Change {}

class Update extends Change {
  String oldFile;
  String newFile;

  Update(String this.oldFile, this.newFile);
  Update.bare() {}

  // Help our test cases along
  bool operator ==(dynamic other) {
    if (!(other is Update)) {
      return false;
    }

    if (this.oldFile == other.oldFile && this.newFile == other.newFile) {
      return true;
    }

    return false;
  }

  String toString() {
    return "Updating\n  $oldFile to\n  $newFile";
  }
}

class Delete extends Change {
  String file;

  Delete(String this.file);
  Delete.bare() {}

  // Help our test cases along
  bool operator ==(dynamic other) {
    if (!(other is Delete)) {
      return false;
    }

    if (this.file == other.file) {
      return true;
    }

    return false;
  }

  String toString() {
    return "Deleting\n  $file";
  }
}

class Same extends Change {
  String file;

  Same(String this.file);
  Same.bare() {}

  // Help our test cases along
  bool operator ==(dynamic other) {
    if (!(other is Same)) {
      return false;
    }

    if (this.file == other.file) {
      return true;
    }

    return false;
  }

  String toString() {
    return "No Change\n  $file";
  }
}
