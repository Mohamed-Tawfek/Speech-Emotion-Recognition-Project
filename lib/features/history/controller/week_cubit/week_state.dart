part of 'week_cubit.dart';

@immutable
abstract class WeekState {}

class WeekInitial extends WeekState {}
class GetWeeklyBarDataLoadingState extends WeekState {}
class GetWeeklyBarDataSuccessState extends WeekState {}
class GetWeeklyBarDataErrorState extends WeekState {}
