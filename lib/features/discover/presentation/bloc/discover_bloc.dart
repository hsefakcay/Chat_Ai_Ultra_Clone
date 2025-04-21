import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/official_model.dart';
import '../../domain/entities/ai_tool.dart';
import '../../domain/entities/expert.dart';
import '../../domain/usecases/get_official_models.dart';
import '../../domain/usecases/get_ai_tools.dart';
import '../../domain/usecases/get_experts.dart';
import '../../../../core/usecases/usecase.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetOfficialModels getOfficialModels;
  final GetAITools getAITools;
  final GetExperts getExperts;

  DiscoverBloc({
    required this.getOfficialModels,
    required this.getAITools,
    required this.getExperts,
  }) : super(DiscoverInitial()) {
    on<LoadDiscoverData>(_onLoadDiscoverData);
  }

  Future<void> _onLoadDiscoverData(LoadDiscoverData event, Emitter<DiscoverState> emit) async {
    emit(DiscoverLoading());

    final officialModelsResult = await getOfficialModels(NoParams());
    final aiToolsResult = await getAITools(NoParams());
    final expertsResult = await getExperts(NoParams());

    await officialModelsResult.fold((failure) async => emit(DiscoverError()), (
      officialModels,
    ) async {
      await aiToolsResult.fold((failure) async => emit(DiscoverError()), (aiTools) async {
        expertsResult.fold(
          (failure) => emit(DiscoverError()),
          (experts) => emit(
            DiscoverLoaded(officialModels: officialModels, aiTools: aiTools, experts: experts),
          ),
        );
      });
    });
  }
}
