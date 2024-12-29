part of 'simple_interest_bloc.dart';

sealed class SimpleInterestEvent extends Equatable {
  const SimpleInterestEvent();

  @override
  List<Object> get props => [];
}

/// Event to calculate simple interest based on principal, rate, and time.
class CalculateSimpleInterestEvent extends SimpleInterestEvent {
  final double principal;
  final double rate;
  final double time;

  const CalculateSimpleInterestEvent({
    required this.principal,
    required this.rate,
    required this.time,
  });

  @override
  List<Object> get props => [principal, rate, time];
}

/// Event to reset the simple interest value to 0.
class ResetInterestEvent extends SimpleInterestEvent {
  const ResetInterestEvent();

  @override
  List<Object> get props => [];
}
