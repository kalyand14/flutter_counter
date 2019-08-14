import 'dart:async';

import 'package:meta/meta.dart';

class ContainerManger {
  Future<String> initialise({
    @required String environment,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return '$environment - token';
  }
}
