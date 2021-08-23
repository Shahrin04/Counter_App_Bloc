import 'package:bloc_tut/Logic/cubit/counter_cubit.dart';
import 'package:bloc_tut/Presentation/Screen/second_page.dart';
import 'package:bloc_tut/Presentation/Screen/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;

  const HomeScreen({Key key, this.title, this.color}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Incremented !!!'),
                    duration: Duration(milliseconds: 600),
                  ));
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Decremented !!!'),
                    duration: Duration(milliseconds: 600),
                  ));
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'its negative ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'its even ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'its five ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 5,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Go to Second Page'),
              color: widget.color,
            ),
            SizedBox(
              height: 14,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: Text('Go to Third Page'),
              color: widget.color,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
