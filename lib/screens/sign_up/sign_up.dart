import 'dart:convert';

import 'package:blog_spark/backend_services/blog_spark_response.dart';
import 'package:blog_spark/backend_services/user_services.dart';
import 'package:blog_spark/caching/user_shared_preferences.dart';
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

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: CustomScrollView(slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Form(
              key: _formKey,
              child: PageSection(children: [
                BlogSparkSizedBox(height: 24),
                RichText(
                    text: TextSpan(
                        text: "Already done this before? ",
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(BlogSparkRoutes.signIn);
                          },
                          child: Text(
                            "Sign in",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Color(0xFF4B53BC)),
                          ),
                        ),
                      )
                    ])),
                BlogSparkSizedBox(height: 4),
                UserField(
                  initialValue: userProvider.firstname,
                  labelText: "Firstname",
                  keyboardType: TextInputType.name,
                  validator: _validator.name,
                  onChanged: (firstname) {
                    userProvider.setFirstname = firstname;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.lastname,
                  labelText: "Lastname",
                  keyboardType: TextInputType.name,
                  validator: _validator.name,
                  onChanged: (lastname) {
                    userProvider.setLastname = lastname;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.username,
                  labelText: "Username",
                  keyboardType: TextInputType.name,
                  validator: _validator.name,
                  onChanged: (username) {
                    userProvider.setUsername = username;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                UserField(
                  initialValue: userProvider.email,
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: _validator.email,
                  onChanged: (email) {
                    userProvider.setEmail = email;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                PasswordField(
                  validator: _validator.password,
                  onChanged: (password) {
                    userProvider.setPassword = password;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                PhoneNumberField(
                  initialValue: userProvider.phoneNumber,
                  validator: _validator.phone,
                  onChanged: (phoneNumber) {
                    userProvider.setPhoneNumber = phoneNumber.completeNumber;
                  },
                ),
                BlogSparkSizedBox(height: 16),
                GenderField(
                  validator: _validator.gender,
                  onChanged: (gender) {
                    userProvider.setGender = gender;
                  },
                ),
                BlogSparkSizedBox(height: 40),
                BlogSparkSizedBox(
                  height: 52,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        BlogSparkActions.showLoading(context);
                        await _signUp();
                      }
                    },
                    child: Text("Sign up"),
                  ),
                ),
                BlogSparkSizedBox(height: 16),
                RichText(
                    text: TextSpan(
                        text: "Don't want to register? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                      TextSpan(text: "Sign in as a "),
                      WidgetSpan(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed(BlogSparkRoutes.home);
                        },
                        child: Text(
                          "Guest",
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Color(0xFF4B53BC)),
                        ),
                      )),
                    ])),
                BlogSparkSizedBox(height: 16),
              ]),
            )
          ]))
        ]),
      );
    });
  }

  _signUp() async {
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
        shouldReplace: true,
        successRoute: BlogSparkRoutes.home);
    actions.takeAction(
      onSuccess: () {
        Map<String, dynamic> body = jsonDecode(response.body);
        UserSharedPreferences.setEmail(body["email"]);
        UserSharedPreferences.setFirstname(body["first_name"]);
        UserSharedPreferences.setLastname(body["last_name"]);
        UserSharedPreferences.setSignedIn(true);
      },
      onError: () {
        Navigator.pop(context);
      },
    );
  }
}
