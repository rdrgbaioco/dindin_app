// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeEvent {}

class HomeInitialize extends HomeEvent {}

class ChangePageIndex extends HomeEvent {
  int index;

  ChangePageIndex({
    required this.index,
  });
}

class UpdateTransactions extends HomeEvent {}
