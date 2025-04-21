part of 'discover_bloc.dart';

abstract class DiscoverEvent extends Equatable {
  const DiscoverEvent();

  @override
  List<Object?> get props => [];
}

class LoadDiscoverData extends DiscoverEvent {
  const LoadDiscoverData();
}
