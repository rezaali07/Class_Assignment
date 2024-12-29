import 'package:bloc_test/bloc/area_circle_bloc.dart';
import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:bloc_test/bloc/dashboard_bloc.dart';
import 'package:bloc_test/bloc/simple_interest_bloc.dart';
import 'package:bloc_test/bloc/student_list_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initBloc();
}

void _initBloc() {
  serviceLocator.registerLazySingleton<ArithmeticBloc>(() => ArithmeticBloc());
  serviceLocator.registerLazySingleton<AreaCircleBloc>(() => AreaCircleBloc());
  serviceLocator
      .registerLazySingleton<SimpleInterestBloc>(() => SimpleInterestBloc());
  serviceLocator
      .registerLazySingleton<StudentListBloc>(() => StudentListBloc());

  serviceLocator.registerLazySingleton<DashboardBloc>(() => DashboardBloc(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ));
}
