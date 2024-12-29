part of 'arithmetic_bloc.dart';

sealed class ArithmeticEvent extends Equatable {
  const ArithmeticEvent();

  @override
  List<Object> get props => [];
}

// When add button is pressed
class IncrementEvent extends ArithmeticEvent {
  final int first;
  final int second;

  const IncrementEvent({required this.first, required this.second});
}

// when subtract button is pressed
class DecrementEvent extends ArithmeticEvent {
  final int first;
  final int second;

  const DecrementEvent({required this.first, required this.second});
}

//when multiply button is pressed
class MultiplyEvent extends ArithmeticEvent {
  final int first;
  final int second;

  const MultiplyEvent({required this.first, required this.second});
}
