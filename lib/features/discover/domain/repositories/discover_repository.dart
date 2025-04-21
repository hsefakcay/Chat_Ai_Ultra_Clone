import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/official_model.dart';
import '../entities/ai_tool.dart';
import '../entities/expert.dart';

abstract class DiscoverRepository {
  Future<Either<Failure, List<OfficialModel>>> getOfficialModels();
  Future<Either<Failure, List<AITool>>> getAITools();
  Future<Either<Failure, List<Expert>>> getExperts();
}
