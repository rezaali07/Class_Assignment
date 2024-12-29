import 'package:bloc_test/app.dart';
import 'package:bloc_test/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  // so that flutter app(ram) is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // service locator dependencies are injected
  initDependencies();
  runApp(
    App(),
  );
}
