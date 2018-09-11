import 'dart:async';

class Job {
  static int counter = 1;

  Function task;
  int id;
  Exception error;
  StackTrace trace;

  Job(this.task) {
    this.id = counter;
    counter++;
  }

  Future<void> run() async {
    try {
      await task();
    } catch (e, s) {
      error = e;
      trace = s;
    }
  }
}
