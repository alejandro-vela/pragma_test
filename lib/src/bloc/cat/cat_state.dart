part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatInitial extends CatState {}

class CatLoadedState extends CatState {
  final List<CatsModel> cats;

  const CatLoadedState({required this.cats});
}

class CatErrorState extends CatState {
  final String message;

  const CatErrorState({required this.message});
}
