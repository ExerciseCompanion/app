import 'package:exercise_companion/features/all_data_provider.dart';
import 'package:exercise_companion/features/user/domain/user_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

//import '../../user/domain/user_db.dart';
import '../../agc_error.dart';
import '../../agc_loading.dart';
import '../../user/data/user_provider.dart';

/// Presents the page containing fields to enter a username and password, plus buttons.
class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  static const routeName = '/';
  final _formKey = GlobalKey<FormBuilderState>();

  void onPressed(BuildContext context, WidgetRef ref, AllData allData) {
    bool validEmailAndPassword =
        _formKey.currentState?.saveAndValidate() ?? false;
    //UserDB userDB = ref.read(userDBProvider);
    //UserDB userDB = ref.read(userDBProvider);
    UserCollection userDB = UserCollection(allData.users);

    if (validEmailAndPassword) {
      String email = _formKey.currentState?.value['email'];
      if (userDB.checkUserEmail(email)) {
        ref.read(currentUserIDProvider.notifier).state =
            userDB.getUserByEmail(email).id;
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Unknown User"),
          //"Unknown User, try one of: ${userDB.getAllEmails().join(', ')}"
          duration: Duration(seconds: 10),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invalid Email or Password.'),
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(context, ref, allData),
        loading: () => const AGCLoading(),
        error: (error, st) => AGCError(error.toString(), st.toString()));
  }

  Widget _build(BuildContext context, WidgetRef ref, AllData allData) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 40.0),
            Column(
              children: <Widget>[
                Image.asset('images/pet_test.png', width: 100),
                const SizedBox(height: 16.0),
                Text(
                  "Welcome to",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Exercise Companion",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            // [Name]
            FormBuilder(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () => {onPressed(context, ref, allData)},
                  child: const Text('Sign in')),
            ),
            const SizedBox(height: 12.0),
            /*Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account? "),
              TextButton(
                child: const Text('Sign up'),
                onPressed: () {
                  // Eventually: pushReplacementNamed
                  Navigator.pushNamed(context, '/signup');
                },
              )
            ]),*/
          ],
        ),
      ),
    );
  }
}
