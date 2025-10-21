import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/auth/widgets/custom_text_form_field.dart';
import 'package:nectar/features/home/screens/home_page.dart';
import 'package:nectar/features/auth/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
                      child: Text("Loging", style: theme.titleLarge),
                    ),
                    Text(
                      "Enter Your emails and password",
                      style: theme.titleSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email", style: theme.titleLarge!.copyWith(fontSize: 24)),
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
                    Text("password", style: theme.titleLarge!.copyWith(fontSize: 24)),
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
                              ?  Icon(
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
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forget Password?",
                            style: theme.bodySmall,
                          ),
                        ),
                      ],
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
                          children: [Text('Log In', style: theme.labelMedium)],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: theme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          child: Text(
                            "Sign up",
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
