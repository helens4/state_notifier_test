import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:state_notifier_test/providers/bg_color.dart';
import 'package:state_notifier_test/providers/counter.dart';
import 'providers/customer_level.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<BgColor, BgColorState>(
          create: (context) => BgColor()
        ),
        StateNotifierProvider<Counter, CounterState>(
            create: (context) => Counter()
        ),
        StateNotifierProvider<CustomerLevel, Level>(
          create: (context) => CustomerLevel()
        )
      ],
      child: MaterialApp(
        title: 'state notifier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple
        ),
        home: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colorState = context.watch<BgColorState>();
    final counterState = context.watch<CounterState>();
    final levelState = context.watch<Level>();

    return Scaffold(
      backgroundColor: levelState == Level.bronze ? Colors.white : levelState == Level.silver ? Colors.grey : Colors.yellow,
      appBar: AppBar(
        title: Text('state notifier')
      ),
      body: Center(
        child: Text(counterState.counter.toString(), style: Theme.of(context).textTheme.headline2)
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'increment',
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<Counter>().increment();
            }
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            tooltip: 'Change Color',
            child: const Icon(Icons.color_lens_outlined),
            onPressed: () {
              context.read<BgColor>().changeColor();
            }
          )
        ]
      ),
    );
  }
}



















