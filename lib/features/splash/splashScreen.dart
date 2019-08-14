import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/splash/bloc/splashbloc_bloc.dart';
import 'package:helloworld/features/splash/bloc/splashbloc_event.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final SplashblocBloc bloc = BlocProvider.of<SplashblocBloc>(context);
    bloc.dispatch(InitialiseContainer());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
            child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )),
      ),
    );
  }
}
