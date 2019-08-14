import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/features/splash/bloc/bloc.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    final ContainerBloc bloc = BlocProvider.of<ContainerBloc>(context);
    bloc.dispatch(InitialiseContainer());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        body: Center(
            child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        )),
      ),
    );
  }
}
