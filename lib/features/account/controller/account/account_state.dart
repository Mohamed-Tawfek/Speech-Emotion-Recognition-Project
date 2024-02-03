part of 'account_cubit.dart';

 abstract class AccountState {}

class SettingsInitial extends AccountState {}
class TakenPhotoState extends AccountState {}
class  GetAccountLoadingState extends AccountState {}
class GetAccountSuccessState extends AccountState {}
class GetAccountErrorState extends AccountState {}
