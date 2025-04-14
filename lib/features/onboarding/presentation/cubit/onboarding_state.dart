import 'package:chat_ai_ultra_clone/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:equatable/equatable.dart';

enum OnboardingStatus { initial, loading, loaded, error }

class OnboardingState extends Equatable {
  final OnboardingStatus status;
  final List<OnboardingEntity> pages;
  final int currentPage;
  final bool isLastPage;
  final String? errorMessage;

  const OnboardingState({
    this.status = OnboardingStatus.initial,
    this.pages = const [],
    this.currentPage = 0,
    this.isLastPage = false,
    this.errorMessage,
  });

  OnboardingState copyWith({
    OnboardingStatus? status,
    List<OnboardingEntity>? pages,
    int? currentPage,
    bool? isLastPage,
    String? errorMessage,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      pages: pages ?? this.pages,
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, pages, currentPage, isLastPage, errorMessage];
}
