part of 'daily_cubit.dart';

@immutable
abstract class DayState {}

class DayInitial extends DayState {}
class GetDailyStateLoading extends DayState {}
class GetDailyStateSuccess extends DayState {}
class GetDailyStateError extends DayState {}

