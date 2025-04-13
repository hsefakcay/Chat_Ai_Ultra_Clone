import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/message.dart';

abstract class ChatRepository {
  Future<Either<Failure, Message>> sendMessage(String content);
}
