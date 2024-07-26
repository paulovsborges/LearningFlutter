import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/features/common/app_assets.dart';
import 'package:presentation/features/common/widgets/primary_button_widget.dart';
import 'package:presentation/features/common/widgets/primary_text_field.dart';
import 'package:presentation/features/splash/splash_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  ZeusAssets.splashBackground,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const PrimaryTextField(
                        label: 'Username',
                      ),
                      const SizedBox(height: 10),
                      const PrimaryTextField(
                        label: 'Password',
                      ),
                      const Spacer(),
                      SafeArea(
                        child: Row(
                          children: [
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: PrimaryButtonWidget(
                                label: 'Register',
                                isLoading: false,
                                isEnabled: true,
                                onTap: () {
                                  context.pushReplacement(SplashPage.routeName);
                                },
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
