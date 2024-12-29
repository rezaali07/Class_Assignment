import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'simple_interest_event.dart';

class SimpleInterestBloc extends Bloc<SimpleInterestEvent, double> {
  SimpleInterestBloc() : super(0.0) {
    // Handle the event to calculate the simple interest
    on<CalculateSimpleInterestEvent>((event, emit) {
      final simpleInterest = (event.principal * event.rate * event.time) / 100;
      emit(simpleInterest); // Emit the calculated simple interest
    });

    // Handle the event to reset the interest calculation
    on<ResetInterestEvent>((event, emit) {
      emit(0.0); // Reset the simple interest to 0
    });
  }
}
