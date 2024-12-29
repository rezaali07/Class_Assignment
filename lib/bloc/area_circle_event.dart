part of 'area_circle_bloc.dart';

sealed class AreaCircleEvent extends Equatable {
  const AreaCircleEvent();

  @override
  List<Object> get props => [];
}

/// Event to calculate the area based on the given radius
class CalculateAreaEvent extends AreaCircleEvent {
  final double radius;

  const CalculateAreaEvent(this.radius);

  @override
  List<Object> get props => [radius];
}

/// Event to reset the area calculation
class ResetAreaEvent extends AreaCircleEvent {
  const ResetAreaEvent();

  @override
  List<Object> get props => [];
}
