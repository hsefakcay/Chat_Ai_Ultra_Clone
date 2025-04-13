import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  const SplashState({this.isRequiredForceUpdate = false, this.isRedirectHome = false});

  final bool isRequiredForceUpdate;
  final bool isRedirectHome;

  @override
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({bool? isRequiredForceUpdate, bool? isRedirectHome}) {
    return SplashState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
