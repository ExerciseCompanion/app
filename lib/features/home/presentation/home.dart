import 'package:exercise_companion/features/pet/domain/pet_db.dart';
import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/pet/domain/user_pets_db.dart';
import 'package:exercise_companion/features/user/domain/user_steps_db.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import '../../generic/presentation/line_chart.dart';
import '../../generic/presentation/aspect_box.dart';
import '../../generic/presentation/bar.dart';
import '../../pet/presentation/pet_img.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../pet/data/pet_home_provider.dart';
import '../../pet/data/user_pet_provider.dart';
import '../../pet/data/pet_provider.dart';
import '../../user/data/user_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    int currentUserID = ref.read(currentUserIDProvider);
    final userDB = ref.read(userDBProvider);
    final userStepsDB = ref.read(userStepsDBProvider);

    return Scaffold(
        /*appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Home",
        ),*/
        body: SlidingUpPanel(
          panel: _panel(context, ref),
          collapsed: _collapsedPanel(
              context, userStepsDB.getTodaysSteps(currentUserID)),
          body: ref.read(homePetProvider),
          /*Pet(
            background: assets["background"] ?? "",
            pet: assets["pet"] ?? "",
            accessory: assets["accessory"] ?? "",
          ),*/
          borderRadius: radius(),
          margin: panelMargins(),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }

  EdgeInsets panelMargins() {
    return const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0);
  }

  BorderRadius radius() {
    return const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
  }

  Widget _panel(BuildContext context, WidgetRef ref) {
    int currentUserID = ref.read(currentUserIDProvider);
    final userDB = ref.read(userDBProvider);
    final userPetDB = ref.read(userPetDBProvider);
    final petDB = ref.read(petDBProvider);
    int mainPetID = userDB.getUser(currentUserID).mainPetID;
    UserPetData userPet = userPetDB.getPet(mainPetID);

    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius(),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20.0,
                color: Colors.grey,
              ),
            ]),
        //margin: panelMargins(),
        child: SingleChildScrollView(
            child: Column(children: [
          const Padding(padding: EdgeInsets.all(10)),
          const Text("Experience"),
          BarWidget(
              percentage: userPet.exp / petDB.getPet(userPet.petID).maxExp,
              color: Color.fromARGB(255, 0, 140, 255)),
          const Padding(padding: EdgeInsets.all(10)),
          const Text("Health"),
          BarWidget(
              percentage:
                  userPet.health / petDB.getPet(userPet.petID).maxHealth,
              color: Color.fromARGB(255, 0, 208, 10)),
          const Padding(padding: EdgeInsets.all(10)),
          const Text("Steps"),
          LineChartSample2(ref: ref),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () => {Navigator.pushNamed(context, "/settings")},
              child: const Text('⚙️ Settings'))
        ])) /*Center(
        child: Text("Walking Statics and Pet Info Goes Here"),
      ),*/
        );
  }

  Widget _collapsedPanel(BuildContext context, steps) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.0,
              0.7,
            ],
            colors: [
              Colors.teal,
              Colors.indigo,
            ],
          ),
          //color: Colors.blueGrey,
          borderRadius: radius()),
      //margin: panelMargins(),
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(7)),
        Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 3,
                right: MediaQuery.of(context).size.width / 3),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.grey,
                  //width: 250,
                  height: 5,
                ))),
        const Padding(padding: EdgeInsets.all(13)),
        Text(
          "$steps Steps Taken Today",
          style: TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}
