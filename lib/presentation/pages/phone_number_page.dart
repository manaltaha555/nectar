import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nectar/presentation/components/phone_number_field.dart';
import 'package:nectar/presentation/pages/home_page.dart';

class PhoneNumberPage extends StatelessWidget {
  PhoneNumberPage({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        backgroundColor: Color(0XFF53B175),
        child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 60),
                child: Text("Enter your mobile phone", style: theme.titleLarge),
              ),
              Text("Mobile number", style: theme.titleSmall),
              PhoneNumberField(
                controller: controller,
                validator: (value) {
                  if (controller.text.trim().isEmpty) {
                    return "Please enter your phone number";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
