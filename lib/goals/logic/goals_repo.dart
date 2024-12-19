import 'package:all_star_trivia_316_b/goals/logic/goals_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class GoalsRepo {
  Future<List<GoalsHiveModel>> getGoals();
  Future<void> setGoals(GoalsHiveModel goalsHiveModel);
}

class GoalsRepoImpl implements GoalsRepo {
  @override
  Future<List<GoalsHiveModel>> getGoals() async {
    final goalsList = await Hive.openBox<GoalsHiveModel>('GoalsList');
    return goalsList.values.toList();
  }

  @override
  Future<void> setGoals(GoalsHiveModel goalsHiveModel) async {
    final goalsList = await Hive.openBox<GoalsHiveModel>('GoalsList');
    await goalsList.add(goalsHiveModel);
  }
}
