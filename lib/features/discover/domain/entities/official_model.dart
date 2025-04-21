import 'package:equatable/equatable.dart';

class OfficialModel extends Equatable {
  final String id;
  final String name;
  final String iconPath;
  final bool isNew;

  const OfficialModel({
    required this.id,
    required this.name,
    required this.iconPath,
    this.isNew = false,
  });

  @override
  List<Object?> get props => [id, name, iconPath, isNew];
}
