import 'dart:async';

class Job {
  static int counter = 1;

  Function task;
  int id;
  Exception exception;
  Error error;
  StackTrace trace;

  Job(this.task) {
    this.id = counter;
    counter++;
  }

  Future<void> run() async {
    try {
      await task();
    } on Exception catch (e, s) {
      exception = e;
      trace = s;
    } on Error catch (e, s) {
      error = e;
      trace = s;
    }
  }
}
