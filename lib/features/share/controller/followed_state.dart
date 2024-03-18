part of 'followed_cubit.dart';

@immutable
abstract class FollowedState {}

class FollowedInitial extends FollowedState {}
class AddFollowedState extends FollowedState {}
class GetFollowedState extends FollowedState {}
class RemoveFollowedState extends FollowedState {}
