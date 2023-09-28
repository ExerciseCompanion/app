import 'package:flutter/material.dart';
import '../templates/appbar.dart';
import '../templates/bottombar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          appBar: AppBar(),
          title: "Home",
        ),
        body: Center(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.7,
            ],
            colors: [
              Colors.teal,
              Colors.indigo,
            ],
          )),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Padding(
                padding: EdgeInsets.all(15.0),
                //child: BusinessCardWidget(),
              ),*/
              Stack(
                //alignment:new Alignment(x, y)
                children: <Widget>[
                  Center(
                      child: Image.asset(
                    'images/lake.jpg',
                    //width: 600,
                    height: 400,
                    //fit: BoxFit.cover,
                    fit: BoxFit.fill,
                  )),
                  Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 400 - 240)),
                      Center(
                        child: Image.asset(
                          'images/pet_test.png',
                          //width: 600,
                          height: 240,
                          //fit: BoxFit.cover,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 514,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                      ListTile(
                        title: Text('this is title'),
                        subtitle: Text('this is sub title'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BaseBottomNavigationBar());
  }
}
