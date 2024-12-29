import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// arithmetic_event is part of arithmetic_bloc file
part 'arithmetic_event.dart';

// Bloc<Event,State>
class ArithmeticBloc extends Bloc<ArithmeticEvent, int> {
  ArithmeticBloc() : super(0) {
    on<IncrementEvent>(
      (event, emit) {
        emit(event.first + event.second);
      },
    );

    on<DecrementEvent>(
      (event, emit) {
        emit(event.first - event.second);
      },
    );

    on<MultiplyEvent>(
      (event, emit) {
        emit(event.first * event.second);
      },
    );
  }
}
