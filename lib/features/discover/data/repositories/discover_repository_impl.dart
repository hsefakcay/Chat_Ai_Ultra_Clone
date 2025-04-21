import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/official_model.dart';
import '../../domain/entities/ai_tool.dart';
import '../../domain/entities/expert.dart';
import '../../domain/repositories/discover_repository.dart';

class DiscoverRepositoryImpl implements DiscoverRepository {
  @override
  Future<Either<Failure, List<OfficialModel>>> getOfficialModels() async {
    try {
      // TODO: Implement actual API call
      return Right([
        OfficialModel(
          id: '1',
          name: 'OpenAI GPT-4.5',
          iconPath: 'assets/images/chatgpt.png',
          isNew: true,
        ),
        OfficialModel(
          id: '2',
          name: 'DeepSeek',
          iconPath: 'assets/images/deepseek.png',
          isNew: true,
        ),
        OfficialModel(
          id: '1',
          name: 'OpenAI GPT-4.5',
          iconPath: 'assets/images/chatgpt.png',
          isNew: true,
        ),
      ]);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<AITool>>> getAITools() async {
    try {
      // TODO: Implement actual API call
      return Right([
        AITool(
          id: '1',
          name: 'Ghibli Tarzı',
          imagePath: 'assets/images/ghib.png',
          description: 'Ghibli tarzında resimler oluşturun',
        ),
        AITool(
          id: '2',
          name: 'Görsel Üretici',
          imagePath: 'assets/images/image.jpg',
          description: 'Yapay zeka ile görsel üretin',
        ),
        AITool(
          id: '1',
          name: 'Ghibli Tarzı',
          imagePath: 'assets/images/ghib.png',
          description: 'Ghibli tarzında resimler oluşturun',
        ),
      ]);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Expert>>> getExperts() async {
    try {
      // TODO: Implement actual API call
      return Right([
        Expert(
          id: '1',
          name: 'Hayat Koçu',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Potansiyelinizi ortaya çıkarmak için sizi yönlendirir',
        ),
        Expert(
          id: '2',
          name: 'Astrolog',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Kozmik yolculuğunuzu ortaya çıkarır',
        ),
        Expert(
          id: '3',
          name: 'Psikolog',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Birlikte zihinsel sağlıkla başa çıkmanızı sağlar',
        ),
        Expert(
          id: '1',
          name: 'Hayat Koçu',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Potansiyelinizi ortaya çıkarmak için sizi yönlendirir',
        ),
        Expert(
          id: '2',
          name: 'Astrolog',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Kozmik yolculuğunuzu ortaya çıkarır',
        ),
        Expert(
          id: '3',
          name: 'Psikolog',
          imagePath: 'assets/images/lifecoach.jpg',
          description: 'Birlikte zihinsel sağlıkla başa çıkmanızı sağlar',
        ),
      ]);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
