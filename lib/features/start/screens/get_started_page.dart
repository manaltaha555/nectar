import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/core/core.dart';
import 'package:nectar/features/auth/screens/signin_option_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.getStarted)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.largeHorizontalPadding,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: AppSizes.smallVerticalPadding,
                      ),
                      child: SvgPicture.asset(AppAssets.whiteCarrot),
                    ),
                    Text(
                      AppStrings.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineLarge,
                    ),
                    Text(
                      AppStrings.subWelcomeMessage,
                      style: textTheme.bodyMedium,
                      // style: TextStyle(
                      //   color: Colors.white38,
                      //   fontSize: 16,
                      //   fontFamily: "Gilori",
                      // ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.largeVerticalPadding,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SigninOptionPage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Get started", style: textTheme.labelMedium),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
