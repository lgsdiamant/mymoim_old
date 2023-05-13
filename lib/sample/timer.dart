import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer.g.dart';

Duration _duration = const Duration();

// @riverpod annotation for stream provider which is equivalent to following code
// final timer = StreamProvider.autoDispose((ref) => Stream.periodic(const Duration(seconds: 1), (_) => addTimer(ref)));
@riverpod
Stream<void> timer(TimerRef ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) => addTimer(ref));
}

// @riverpod annotation for state provider which is equivalent to following code
// StateProvider<int> addSecondsProvider = StateProvider((ref) => 1);
@riverpod
class AddTiming extends _$AddTiming {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  int build() => 1;
}

void addTimer(ref) {
  final timing = ref.watch(addTimingProvider.notifier).state + _duration.inSeconds;
  _duration = Duration(seconds: timing);
}

class TimerPage extends ConsumerWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final streamCount = ref.watch(timerProvider);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(_duration.inMinutes.remainder(60));
    String seconds = twoDigits(_duration.inSeconds.remainder(60));
    String hours = twoDigits(_duration.inHours);
    final backGroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: const Text("Timer - StreamProvider"),
      ),
      body: Column(
        children: [
          streamCount.when(
            data: (value) {
              return Center(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 50, bottom: 20),
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    child: Text(
                      "$hours:$minutes:$seconds",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    )),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text(error.toString()),
          ),
        ],
      ),
    );
  }
}

class TimerContainer extends ConsumerWidget {
  const TimerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final streamCount = ref.watch(timerProvider);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String minutes = twoDigits(_duration.inMinutes.remainder(60));
    String seconds = twoDigits(_duration.inSeconds.remainder(60));
    String hours = twoDigits(_duration.inHours);
    final backGroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return streamCount.when(
      data: (value) {
        return Center(
          child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 40, right: 40, top: 50, bottom: 20),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: backGroundColor,
                    width: 5,
                  )),
              child: Text(
                "$hours:$minutes:$seconds",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              )),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
