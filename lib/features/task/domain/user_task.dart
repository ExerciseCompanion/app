import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_task.freezed.dart';
part 'user_task.g.dart';

@Freezed()
class UserTask with _$UserTask {
  const factory UserTask({
    required int id,
    required int userID,
    required String title,
    required String description,
    required int reward,
    required int status,
  }) = _UserTask;

  const UserTask._();

  factory UserTask.fromJson(Map<String, dynamic> json) =>
      _$UserTaskFromJson(json);

  // Test that the json file can be converted into entities.
  /*static Future<List<UserTask>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/UserTasks.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => UserTask.fromJson(jsonData)).toList();
  }*/
}
