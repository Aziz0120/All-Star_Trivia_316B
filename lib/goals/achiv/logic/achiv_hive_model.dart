import 'package:hive_flutter/hive_flutter.dart';

part 'achiv_hive_model.g.dart';

@HiveType(typeId: 0)
class AchivHiveModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String image;
  @HiveField(2)
  String name;
  @HiveField(3)
  String description;

  AchivHiveModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });
}
