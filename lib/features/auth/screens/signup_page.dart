import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/auth/widgets/custom_text_form_field.dart';
import 'package:nectar/features/home/screens/home_page.dart';
import 'package:nectar/features/auth/screens/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginState();
}

class _LoginState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  final RegExp usernameRegex = RegExp(r'^[A-Za-z ]+$');
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset(AppImages.coloredCarrot),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text("Sign up", style: theme.titleLarge),
                    ),
                    Text(
                      "Enter Your credentials to continue",
                      style: theme.titleSmall,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(
                        "Username",
                        style: theme.titleLarge!.copyWith(fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomTextFormField(
                          hint: "Username",
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter username";
                            } else if (!usernameRegex.hasMatch(value) ||
                                value.length > 20) {
                              return "Enter valid username";
                            }
                            return null;
                          },
                          isObsecure: false,
                        ),
                      ),
                      Text(
                        "Email",
                        style: theme.titleLarge!.copyWith(fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomTextFormField(
                          hint: "email",
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter email";
                            } else if (!value.contains("@")) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          isObsecure: false,
                        ),
                      ),
                      Text(
                        "password",
                        style: theme.titleLarge!.copyWith(fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: CustomTextFormField(
                          hint: "password",
                          isObsecure: isObsecure,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                            icon: isObsecure
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.subtitleColor
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color:AppColors.subtitleColor
                                  ),
                          ),
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
          ),
        ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "By continuing you agree to our ",
                            style: theme.titleSmall,
                          ),
                          TextSpan(
                            text: "Terms Of Service ",
                            style: theme.titleSmall!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(text: "and ", style: theme.titleSmall),
                          TextSpan(
                            text: "Privacy Policy",
                            style: theme.titleSmall!.copyWith(
                              color:AppColors.primaryColor
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Sign Up', style: theme.labelMedium)],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: theme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign in",
                            style: theme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
