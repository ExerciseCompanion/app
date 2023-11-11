// import 'package:exercise_companion/features/user/domain/user_db.dart';
import 'package:exercise_companion/features/accessory/domain/accessory_collection.dart';
import 'package:exercise_companion/features/agc_loading.dart';
import 'package:flutter/material.dart';
import '../../accessory/domain/accessory.dart';
// import '../../accessory/domain/accessory_db.dart';
import '../../agc_error.dart';
import '../../all_data_provider.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import '../../accessory/presentation/accessory_card.dart';
import '../../user/domain/user_collection.dart';
import 'pet_img.dart';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/pet_customization_provider.dart';
import '../../user/data/user_provider.dart';

class CustomizationPage extends ConsumerWidget {
  const CustomizationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(context, ref, allData),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(BuildContext context, WidgetRef ref, AllData allData) {
    //Map<String, String> assets = userDB.getMainPetAsset(currentUserID);

    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Wardrobe",
        ),
        /*body: Column(children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xFF3D2C50),
                /*image: DecorationImage(
                image: AssetImage('images/backgrounds/test.jpg'),
                fit: BoxFit.cover,
              ),*/
              ),
              height: MediaQuery.of(context).size.height - 114,
              child: Pet(
                  background: 'images/backgrounds/test.jpg',
                  pet: 'images/pet_test.png',
                  accessory: 'images/red_cap.png')),
          accessoryContainer(context),
        ]),*/
        body: Stack(children: [
          ref.watch(customizePetProvider),
          accessoryContainer(context, allData)
        ]),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BaseBottomNavigationBar());
  }

  Widget accessoryContainer(BuildContext context, AllData allData) {
    // int currentUserID = ref.read(currentUserIDProvider);
    // final userDB = ref.read(userDBProvider);
    int currentUserID = allData.currentUserID;
    UserCollection userDB = UserCollection(allData.users);
    AccessoryCollection accessoryDB = AccessoryCollection(allData.accessories);

    List<Accessory> accesssories =
        userDB.getAccessories(currentUserID, accessoryDB);

    return Column(children: [
      Padding(
          padding: EdgeInsets.only(
              top: max(MediaQuery.of(context).size.height - 312, 0))),
      Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                    ),
                  ]),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: Colors.white,
                      //width: 150,
                      height: 124,
                      child: SizedBox(
                          height: 210,
                          child: ListView.separated(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.all(12),
                            itemCount: accesssories.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 12);
                            },
                            itemBuilder: (context, index) {
                              return AccessoryCardWidget(
                                  index: index,
                                  name: accesssories[index].name,
                                  asset: accesssories[index].asset,
                                  accessoryId: accesssories[index].id);
                            },
                          ))))))
    ]);
  }
}
