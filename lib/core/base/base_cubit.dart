import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Loading extends BaseState {}

class Loaded extends BaseState {}

abstract class BaseCubit<T extends BaseState> extends Cubit<T> {
  BaseCubit(super.initialState);

  bool get isBusy => state is Loading;

  void showLoading() => emit(Loading() as T);
  void hideLoading() => emit(Loaded() as T);
}
