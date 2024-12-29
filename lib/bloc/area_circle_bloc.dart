import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'area_circle_event.dart';

class AreaCircleBloc extends Bloc<AreaCircleEvent, double> {
  AreaCircleBloc() : super(0.0) {
    // Handle the event to calculate the area
    on<CalculateAreaEvent>((event, emit) {
      final radius = event.radius;
      final area = 3.14159 * radius * radius; // π * r²
      emit(area);
    });

    // Handle the event to reset the area
    on<ResetAreaEvent>((event, emit) {
      emit(0.0);
    });
  }
}
