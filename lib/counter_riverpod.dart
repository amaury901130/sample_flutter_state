import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((_) => 0);

class CounterRiverpodPage extends ConsumerWidget {
  const CounterRiverpodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Watch the changes on the provider
    final int value = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Center(
          child: Text(
            '$value',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // The read method is a utility to read a provider without listening to it
          onPressed: () => ref.read(counterProvider.notifier).state++,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
