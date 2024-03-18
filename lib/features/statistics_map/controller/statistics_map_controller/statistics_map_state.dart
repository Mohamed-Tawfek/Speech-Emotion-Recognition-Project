part of 'statistics_map_cubit.dart';

@immutable
abstract class StatisticsMapState {}

class StatisticsMapInitial extends StatisticsMapState {}
class ChangeToggleTapState extends StatisticsMapState {}
class GetDataState extends StatisticsMapState {}
class SetMapControllerState extends StatisticsMapState {}

