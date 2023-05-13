import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymoim/sample/counter.dart';
import 'package:mymoim/sample/product.dart';
import 'package:mymoim/sample/timer.dart';

class MySampleApp extends StatelessWidget {
  const MySampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const CounterPage()
      // home: const ProductPage(),
      home: const _HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum BottomSelector { counter, product, timer }

final StateProvider<BottomSelector> bottomSelector = StateProvider((ref) => BottomSelector.counter);
final StateProvider<String> appTitle = StateProvider((ref) => 'Riverpod');

class _HomePage extends ConsumerWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final title = ref.watch(appTitle).toString();

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        backgroundColor: Colors.lightBlue,
        body: mainContainer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Counter'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Product'),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Timer'),
          ],
          currentIndex: ref.watch(bottomSelector).index,
          onTap: (index) {
            ref.read(bottomSelector.notifier).state = BottomSelector.values[index];
            ref.read(appTitle.notifier).state = 'Riverpod - ${BottomSelector.values[index].toString().split('.').last}';
          },
        ));
  }
}

Widget mainContainer() {
  return Consumer(
    builder: (context, ref, child) {
      final selector = ref.watch(bottomSelector.notifier).state;
      switch (selector) {
        case BottomSelector.counter:
          return const CounterContainer();
        case BottomSelector.product:
          return const ProductContainer();
        case BottomSelector.timer:
          return const TimerContainer();
        default:
          return const CounterContainer();
      }
    },
  );
}
