import 'package:equatable/equatable.dart';

class AITool extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final String description;

  const AITool({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, imagePath, description];
}
