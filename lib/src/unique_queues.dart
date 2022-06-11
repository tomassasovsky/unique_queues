import 'package:queue/queue.dart';
export 'package:queue/queue.dart';

/// {@template unique_queues}
/// A Dart package that lets you keep a list of queues for specified key values.
/// {@endtemplate}
class UniqueQueues {
  /// {@macro unique_queues}
  UniqueQueues();

  /// The unique [Queue] instance.
  final queues = <Object, Queue>{};

  /// Returns the computation for the [process] while keeping it queued.
  Future<T> addToQueue<T>(Object uniqueId, Future<T> Function() process) async {
    final userHasAnExistingQueue = queues.containsKey(uniqueId);
    if (!userHasAnExistingQueue) {
      queues[uniqueId] = Queue();
    }
    final queue = queues[uniqueId];
    return queue!.add(process);
  }

  /// Clears the [Queue]s.
  void dispose() => queues.clear();
}
