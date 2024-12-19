import 'package:all_star_trivia_316_b/goals/achiv/logic/achiv_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AchivRepo {
  Future<List<AchivHiveModel>> getAchiv();
  Future<void> setAchiv(AchivHiveModel achivHiveModel);
}

class AchivRepoImpl implements AchivRepo {
  @override
  Future<List<AchivHiveModel>> getAchiv() async {
    final achivList = await Hive.openBox<AchivHiveModel>('AchivList');
    return achivList.values.toList();
  }

  @override
  Future<void> setAchiv(AchivHiveModel achivHiveModel) async {
    final achivList = await Hive.openBox<AchivHiveModel>('AchivList');
    await achivList.add(achivHiveModel);
  }
}
