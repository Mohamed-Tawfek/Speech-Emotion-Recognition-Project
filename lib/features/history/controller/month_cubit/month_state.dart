part of 'month_cubit.dart';

@immutable
abstract class MonthState {}

class MonthInitial extends MonthState {}
class ChangeSelectedMonthState extends MonthState {}
class GetMonthlyLoadingState extends MonthState {}
class GetMonthlySuccessState extends MonthState {}
class GetMonthlyErrorState extends MonthState {}
