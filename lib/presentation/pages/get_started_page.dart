import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/presentation/pages/signin_option_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/GetStarted.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SvgPicture.asset("assets/icons/carrot.svg"),
                    ),
                    Text(
                      "Welcome\n to our store",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Gilori",
                        fontSize: 48,
                      ),
                    ),
                    Text(
                      "Get your groceries in as fast as one hour",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                        fontFamily: "Gilori",
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SigninOptionPage(),
                      ),
                      (Route<dynamic> route) =>
                          false, 
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Get started", style: theme.labelMedium)],
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
