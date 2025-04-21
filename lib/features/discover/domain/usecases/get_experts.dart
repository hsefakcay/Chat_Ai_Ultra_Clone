import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/expert.dart';
import '../repositories/discover_repository.dart';

class GetExperts implements UseCase<List<Expert>, NoParams> {
  final DiscoverRepository repository;

  GetExperts(this.repository);

  @override
  Future<Either<Failure, List<Expert>>> call(NoParams params) async {
    return await repository.getExperts();
  }
}
