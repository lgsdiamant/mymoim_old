import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

//This is the Provider, we are using it because we need to access the title text
final title = Provider<String>((ref) => "Simple Counter");

//we are using StateProvider here because the counter will be changing in state
final counter2 = StateProvider((ref) => 0);

/// Annotating a class by `@riverpod` defines a new shared state for your application,
/// accessible using the generated [counterProvider].
/// This class is both responsible for initializing the state (through the [build] method)
/// and exposing ways to modify it (cf [increment]).
@riverpod
class Counter extends _$Counter {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  int build() => 0;

  void increment() => state++;

  void decrement() => state--;

  void refresh() {
    state = 0;
  }
}

// TitlePage With ConsumerWidget
class TitlePageWithConsumerWidget extends ConsumerWidget {
  const TitlePageWithConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleText = ref.watch(title).toString();
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Text("RiverPod Example App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(titleText, style: const TextStyle(color: Colors.white, fontSize: 30)),
              ),
            ],
          ),
        ));
  }
}

class CounterContainer extends ConsumerWidget {
  const CounterContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final titleText = ref.watch(title);
    final count = ref.watch(counterProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text(titleText, style: const TextStyle(color: Colors.white, fontSize: 30)),
          ),
          Text(
            count.toString(),
            style: const TextStyle(color: Colors.white, height: 5, fontSize: 23),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformElevatedButton(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                onPressed: () => ref.watch(counterProvider.notifier).increment(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 1),
                    Text('Add'),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              PlatformElevatedButton(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                onPressed: () => ref.watch(counterProvider.notifier).decrement(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove),
                    SizedBox(width: 10),
                    Text('Minus'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlatformElevatedButton(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.replay),
                      SizedBox(width: 10),
                      Text('Refresh'),
                    ],
                  ),
                  onPressed: () => ref.watch(counterProvider.notifier).refresh(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
