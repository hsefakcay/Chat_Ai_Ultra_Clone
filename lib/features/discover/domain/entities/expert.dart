import 'package:equatable/equatable.dart';

class Expert extends Equatable {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final bool isAvailable;

  const Expert({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    this.isAvailable = true,
  });

  @override
  List<Object?> get props => [id, name, imagePath, description, isAvailable];
}
