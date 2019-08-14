import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/counter/bloc/bloc.dart';

class CounterWidget extends StatelessWidget {
  final int count;

  CounterWidget({Key key, @required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome to counter application"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: NavigationLayout(),
    );
  }
}

class NavigationLayout extends StatefulWidget {
  const NavigationLayout({
    Key key,
  }) : super(key: key);

  @override
  _NavigationLayoutState createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            bloc.dispatch(CounterEvent.increment);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        SizedBox(
          width: 10,
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            bloc.dispatch(CounterEvent.decrement);
          },
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
