import 'package:bloc_test/bloc/dashboard_bloc.dart';
import 'package:bloc_test/service_locator/service_locator.dart';
import 'package:bloc_test/view/dashboard_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC',
      home: BlocProvider.value(
          value: serviceLocator<DashboardBloc>(), child: DashboardBlocView()),
    );
  }
}
