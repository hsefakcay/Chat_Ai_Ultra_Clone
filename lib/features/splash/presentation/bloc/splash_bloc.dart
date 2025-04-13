import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_force_update.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckForceUpdate checkForceUpdate;

  SplashBloc({required this.checkForceUpdate}) : super(const SplashState()) {
    on<CheckSplashState>(_onCheckSplashState);
  }

  Future<void> _onCheckSplashState(CheckSplashState event, Emitter<SplashState> emit) async {
    final bool needsForceUpdate = await checkForceUpdate();

    if (needsForceUpdate) {
      emit(state.copyWith(isRequiredForceUpdate: true));
      return;
    }

    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(isRedirectHome: true));
  }
}
