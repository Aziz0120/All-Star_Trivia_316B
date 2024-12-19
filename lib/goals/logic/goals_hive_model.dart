import 'package:hive_flutter/hive_flutter.dart';

part 'goals_hive_model.g.dart';

@HiveType(typeId: 1)
class GoalsHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String name;
  @HiveField(3)
  String description;

  GoalsHiveModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });
}
