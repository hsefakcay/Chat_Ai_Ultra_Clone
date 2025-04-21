import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/ai_tool.dart';
import '../repositories/discover_repository.dart';

class GetAITools implements UseCase<List<AITool>, NoParams> {
  final DiscoverRepository repository;

  GetAITools(this.repository);

  @override
  Future<Either<Failure, List<AITool>>> call(NoParams params) async {
    return await repository.getAITools();
  }
}
