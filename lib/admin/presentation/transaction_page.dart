import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends_khata/admin/presentation/widgets/friends_datatable.dart';
import 'package:friends_khata/core/presentation/validators/form_validators.dart';
import 'package:friends_khata/core/presentation/widgets/form_text_input.dart';
import 'package:friends_khata/core/presentation/router/router.gr.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction'),
        actions: [
          TextButton(
            onPressed: () {
              context.pushRoute(const EditMembersRoute());
            },
            child: Text(
              "Edit",
              style: TextStyle(color: Colors.white), //TODO: remove line
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: screenSize.width / 6 * 5,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.green[500],
          onPressed: () {},
          label: const Text("Save"),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TransactionForm(),
        ),
      ),
    );
  }
}

class TransactionForm extends ConsumerStatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextInput(
            label: 'Email',
            icon: Icons.email_rounded,
            validator: FormValidators.emailValidator(),
            controller: _emailController,
          ),
          FormTextInput(
            label: 'Password',
            icon: Icons.lock_outline_rounded,
            secure: true,
            validator: FormValidators.passwordValidator(),
            controller: _passwordController,
          ),
          ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            title: const Text("Friends"),
          ),
          SizedBox(
            height: (screenSize.height / 3) * 2,
            child: ListView(
              children: [
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
                ListTile(
                  leading: Checkbox(
                    onChanged: (value) {},
                    value: false,
                  ),
                  title: const Text("Abdullah"),
                ),
              ],
            ),
          )
          // SizedBox(
          //   height: screenSize.height / 2,
          //   child: FriendsDatatable(),
          // ),
        ],
      ),
    );
  }
}
