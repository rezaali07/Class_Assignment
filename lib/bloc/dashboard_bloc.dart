import 'package:bloc_test/bloc/area_circle_bloc.dart';
import 'package:bloc_test/bloc/arithmetic_bloc.dart';
import 'package:bloc_test/bloc/simple_interest_bloc.dart';
import 'package:bloc_test/bloc/student_list_bloc.dart';
import 'package:bloc_test/view/area_circle_view.dart';
import 'package:bloc_test/view/arithmetic_bloc_view.dart';
import 'package:bloc_test/view/simple_interest_view.dart';
import 'package:bloc_test/view/student_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<void> {
  DashboardBloc(
    this._arithmeticBloc,
    this._areaCircleBloc,
    this._simpleInterestBloc,
    this._studentListBloc,
  ) : super(null);

  final ArithmeticBloc _arithmeticBloc;
  final AreaCircleBloc _areaCircleBloc;
  final SimpleInterestBloc _simpleInterestBloc;
  final StudentListBloc _studentListBloc;

  void openArithmeticBlocView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _arithmeticBloc,
            child: ArithmeticBlocView(),
          ),
        ));
  }

  void openAreaCircleView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _areaCircleBloc,
            child: AreaCircleView(),
          ),
        ));
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _simpleInterestBloc,
            child: SimpleInterestView(),
          ),
        ));
  }

  void openStudentListView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _studentListBloc,
            child: StudentListView(),
          ),
        ));
  }
}
