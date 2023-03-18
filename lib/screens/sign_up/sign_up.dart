import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/user_services.dart';
import 'package:blog_spark/components/blog_spark_sized_box.dart';
import 'package:blog_spark/components/page_section.dart';
import 'package:blog_spark/components/text_fields/gender_field.dart';
import 'package:blog_spark/components/text_fields/password_field.dart';
import 'package:blog_spark/components/text_fields/phone_number_field.dart';
import 'package:blog_spark/components/text_fields/user_field.dart';
import 'package:blog_spark/models/user.dart';
import 'package:blog_spark/providers/user_provider.dart';
import 'package:blog_spark/utils/blog_spark_actions/blog_spark_actions.dart';
import 'package:blog_spark/utils/blog_spark_routes/route_names.dart';
import 'package:blog_spark/utils/input_validator/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    InputValidator validator = InputValidator();
    return Consumer<UserProvider>(
        builder: (context, userProvider, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Form(
              key: formKey,
              child: PageSection(children: [
                BlogSparkSizedBox(height: 24),
                UserField(
                  initialValue: userProvider.firstname,
                  labelText: "Firstname",
                  keyboardType: TextInputType.name,
                  validator: validator.name,
                  onChanged: (firstname) {
                    userProvider.setFirstname = firstname;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.lastname,
                  labelText: "Lastname",
                  keyboardType: TextInputType.name,
                  validator: validator.name,
                  onChanged: (lastname) {
                    userProvider.setLastname = lastname;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.username,
                  labelText: "Username",
                  keyboardType: TextInputType.name,
                  validator: validator.name,
                  onChanged: (username) {
                    userProvider.setUsername = username;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.email,
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: validator.email,
                  onChanged: (email) {
                    userProvider.setEmail = email;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                PasswordField(
                  validator: validator.password,
                  onChanged: (password) {
                    userProvider.setPassword = password;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                PhoneNumberField(
                  initialValue: userProvider.phoneNumber,
                  validator: validator.phone,
                  onChanged: (phoneNumber) {
                    userProvider.setPhoneNumber = phoneNumber.completeNumber;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                GenderField(
                  validator: validator.gender,
                  onChanged: (gender) {
                    userProvider.setGender = gender;
                  },
                ),
                BlogSparkSizedBox(height: 40),
                BlogSparkSizedBox(
                  height: 52,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _signUp(context);
                      }
                    },
                    child: Text("Sign up"),
                  ),
                ),
                BlogSparkSizedBox(height: 16),
              ]),
            )
          ]))
        ]),
      );
    });
  }

  _signUp(BuildContext context) async {
    UserProvider userProvider = context.read<UserProvider>();
    User user = User(
        firstname: userProvider.firstname,
        lastname: userProvider.lastname,
        username: userProvider.username,
        email: userProvider.email,
        phoneNumber: userProvider.phoneNumber,
        password: userProvider.password,
        gender: userProvider.gender);
    UserServices userServices = UserServices(user: user);
    BlogSparkResponse response = await userServices.signUp();
    BlogSparkActions actions = BlogSparkActions(
        context: context,
        response: response,
        successRoute: BlogSparkRoutes.home);
    actions.takeAction();
  }
}
