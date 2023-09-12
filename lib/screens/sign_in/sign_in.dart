import 'dart:convert';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/user_services.dart';
import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/components/page_section.dart';
import 'package:blog_spark/components/text_fields/password_field.dart';
import 'package:blog_spark/components/text_fields/user_field.dart';
import 'package:blog_spark/models/user.dart';
import 'package:blog_spark/providers/user_provider.dart';
import 'package:blog_spark/utils/blog_spark_actions/blog_spark_actions.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/input_validator/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late GlobalKey<FormState> _formKey;
  late InputValidator _validator;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _validator = InputValidator();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<UserProvider>(
        builder: (context, userProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(title: Text("Sign in")),
        body: Form(
            key: _formKey,
            child: PageSection(
              children: [
                BlogSparkSizedBox(height: 24),
                UserField(
                  initialValue: userProvider.email,
                  labelText: "Email",
                  keyboardType: TextInputType.name,
                  validator: _validator.email,
                  onChanged: (email) {
                    userProvider.setEmail = email;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                PasswordField(
                  onChanged: (password) {
                    userProvider.setPassword = password;
                  },
                ),
                BlogSparkSizedBox(height: 40),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BlogSparkSizedBox(
                    height: 52,
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          BlogSparkActions.showLoading(context);
                          await _signIn();
                        }
                      },
                      child: Text("Sign in"),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }

  _signIn() async {
    UserProvider userProvider = context.read<UserProvider>();
    User user = User(
      email: userProvider.email,
      password: userProvider.password,
    );
    UserServices userServices = UserServices(user: user);
    BlogSparkResponse response = await userServices.signIn();
    BlogSparkActions actions = BlogSparkActions(
        context: context,
        response: response,
        shouldReplace: true,
        successRoute: BlogSparkRoutes.home);
    actions.takeAction(
      onSuccess: () {
        userProvider.setUser = jsonDecode(response.body);
      },
      onError: () {
        Navigator.of(context).pop();
      },
    );
  }
}
