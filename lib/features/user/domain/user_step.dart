import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_step.freezed.dart';
part 'user_step.g.dart';

@freezed
class UserStep with _$UserStep {
  const factory UserStep({
    required int id,
    required int userID,
    required String date,
    required int steps,
  }) = _UserStep;

  const UserStep._();

  factory UserStep.fromJson(Map<String, dynamic> json) =>
      _$UserStepFromJson(json);

  // Test that the json file can be converted into entities.
  /*static Future<List<UserStep>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/UserSteps.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => UserStep.fromJson(jsonData)).toList();
  }*/
}
