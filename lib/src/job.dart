import 'dart:async';

class Job {
  Function task;

  Job(this.task) {}

  Future<void> run() async {
    await task();
  }
}
