part of 'discover_bloc.dart';

abstract class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object?> get props => [];
}

class DiscoverInitial extends DiscoverState {
  const DiscoverInitial();
}

class DiscoverLoading extends DiscoverState {
  const DiscoverLoading();
}

class DiscoverError extends DiscoverState {
  const DiscoverError();
}

class DiscoverLoaded extends DiscoverState {
  final List<OfficialModel> officialModels;
  final List<AITool> aiTools;
  final List<Expert> experts;

  const DiscoverLoaded({
    required this.officialModels,
    required this.aiTools,
    required this.experts,
  });

  @override
  List<Object?> get props => [officialModels, aiTools, experts];
}
