import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/auth/widgets/phone_number_field.dart';
import 'package:nectar/features/auth/screens/login_page.dart';
import 'package:nectar/features/auth/screens/phone_number_page.dart';

class SigninOptionPage extends StatelessWidget {
  SigninOptionPage({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppImages.signOptions),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get your grocieries\n with nectar",
                  style: theme.titleLarge,
                  textAlign: TextAlign.left,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PhoneNumberPage(),
                      ),
                    );
                  },
                  child: IgnorePointer(
                    child: PhoneNumberField(controller: controller),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: Text("or log in using:", style: theme.titleSmall),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.email_outlined, size: 30),
                        Text("Continue with email", style: theme.labelMedium),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        AppImages.googleIcon,
                        height: 30,
                        width: 30,
                      ),
                      Text("Continue with gmail", style: theme.labelMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
