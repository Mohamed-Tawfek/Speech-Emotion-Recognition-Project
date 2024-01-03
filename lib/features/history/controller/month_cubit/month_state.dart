part of 'month_cubit.dart';

@immutable
abstract class MonthState {}

class MonthInitial extends MonthState {}
class ChangeSelectedMonthState extends MonthState {}
