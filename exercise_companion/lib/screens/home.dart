import 'package:exercise_companion/data_model/user_db.dart';
import 'package:exercise_companion/data_model/user_steps_db.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';
import '../elements/line_chart.dart';
import '../elements/aspect_box.dart';
import '../elements/pet.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> assets = userDB.getMainPetAsset(currentUserID);
    return Scaffold(
        /*appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Home",
        ),*/
        body: SlidingUpPanel(
          panel: _panel(),
          collapsed: _collapsedPanel(
              context, userStepsDB.getTodaysSteps(currentUserID)),
          body: Pet(
            background: assets["background"] ?? "",
            pet: assets["pet"] ?? "",
            accessory: assets["accessory"] ?? "",
            /*background: 'images/backgrounds/test.jpg',
              pet: 'images/pet_test.png',
              accessory: 'images/red_cap.png'*/
          ),
          borderRadius: radius(),
          margin: panelMargins(),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
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

  Widget _panel() {
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
          LineChartSample2()
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
