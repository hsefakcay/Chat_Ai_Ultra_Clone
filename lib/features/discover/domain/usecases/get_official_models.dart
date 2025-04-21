import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/official_model.dart';
import '../repositories/discover_repository.dart';

class GetOfficialModels implements UseCase<List<OfficialModel>, NoParams> {
  final DiscoverRepository repository;

  GetOfficialModels(this.repository);

  @override
  Future<Either<Failure, List<OfficialModel>>> call(NoParams params) async {
    return await repository.getOfficialModels();
  }
}
