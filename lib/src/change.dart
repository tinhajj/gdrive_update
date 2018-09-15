enum ChangeType { nochange, update, delete }

class Change {
  ChangeType type;
  String name;

  Change.bare() {}

  Change(ChangeType this.type, String this.name) {}

  // Help our test cases along
  bool operator ==(dynamic other) {
    if (!(other is Change)) {
      return false;
    }

    if (this.type == other.type && this.name == other.name) {
      return true;
    }

    return false;
  }
}
