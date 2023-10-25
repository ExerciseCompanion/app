import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/task/domain/user_task_db.dart';
import 'package:flutter/material.dart';
import '../../generic/presentation/appbar.dart';
import '../../generic/presentation/bottombar.dart';
import 'task_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/task_provider.dart';

class TaskPage extends ConsumerWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Tasks",
        ),
        body: ListView(children: ref.watch(taskProvider)
            //children: userTasksDB.getTaskWidgets(currentUserID),
            ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }
}
