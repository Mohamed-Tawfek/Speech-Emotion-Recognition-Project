part of 'change_account_info_cubit.dart';

@immutable
abstract class ChangeAccountInfoState {}

class ChangeAccountInfoInitial extends ChangeAccountInfoState {}
class TakenPhotoState extends ChangeAccountInfoState {}
class  GetAccountLoadingState extends ChangeAccountInfoState {}
class GetAccountSuccessState extends ChangeAccountInfoState {}
class GetAccountErrorState extends ChangeAccountInfoState {}
