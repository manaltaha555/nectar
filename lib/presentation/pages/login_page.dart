import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/presentation/components/custom_text_form_field.dart';
import 'package:nectar/presentation/pages/home_page.dart';
import 'package:nectar/presentation/pages/signup_page.dart';

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
                  child: SvgPicture.asset("assets/icons/colored_carrot.svg"),
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
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Color(0xFF7C7C7C),
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Color(0xFF7C7C7C),
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
                              color: Color(0XFF53B175),
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
