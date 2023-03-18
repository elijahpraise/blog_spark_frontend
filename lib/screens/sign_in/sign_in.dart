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

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    InputValidator validator = InputValidator();
    return Consumer<UserProvider>(
        builder: (context, userProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(title: Text("Sign in")),
        body: Form(
            key: formKey,
            child: PageSection(
              children: [
                BlogSparkSizedBox(height: 24),
                UserField(
                  initialValue: userProvider.email,
                  labelText: "Email",
                  keyboardType: TextInputType.name,
                  validator: validator.email,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BlogSparkSizedBox(
                    height: 52,
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _signIn(context);
                        }
                      },
                      child: Text("Sign up"),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }

  _signIn(BuildContext context) async {
    UserProvider userProvider = context.read<UserProvider>();
    User user = User(
      email: userProvider.email,
      password: userProvider.password,
    );
    UserServices userServices = UserServices(user: user);
    BlogSparkResponse response = await userServices.signUp();
    BlogSparkActions actions = BlogSparkActions(
        context: context,
        response: response,
        successRoute: BlogSparkRoutes.home);
    actions.takeAction();
  }
}
