import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  static String routeURL = "/";
  static String routeName = "signUp";
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    context.pushNamed(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsernameScreen(),
      ),
    );
    /*
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(
          seconds: 1,
        ),
        reverseTransitionDuration: Duration(
          seconds: 1,
        ),
        pageBuilder: (context, animation, secondaryAnimation) =>
            UsernameScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween(
            begin: Offset(0, 1),
            end: Offset.zero,
          ).animate(animation);
          final opcaityAnimation = Tween(
            begin: 0.5,
            end: 1.0,
          ).animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(
              opacity: opcaityAnimation,
              child: child,
            ),
          );
        },
      ),
    );
    */
  }

  void _onAppleTap(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  Text(
                    S.of(context).signUpTitle("TikTok"),
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  Text(
                    S.of(context).signUpSubtitle(0),
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: isDarkMode(context)
                          ? Colors.grey.shade300
                          : Colors.black45,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      text: S.of(context).emailPasswordButton,
                      icon: FaIcon(FontAwesomeIcons.user),
                      onTap: _onEmailTap,
                    ),
                    Gaps.v16,
                    AuthButton(
                      text: S.of(context).appleButton,
                      icon: FaIcon(FontAwesomeIcons.apple),
                      onTap: _onAppleTap,
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            text: S.of(context).emailPasswordButton,
                            icon: FaIcon(FontAwesomeIcons.user),
                            onTap: _onEmailTap,
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            text: "Continue with Apple",
                            icon: FaIcon(FontAwesomeIcons.apple),
                            onTap: _onAppleTap,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            shadowColor: Colors.black,
            elevation: 2,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).alreadyHaveAnAccount),
                Gaps.h5,
                GestureDetector(
                  onTap: () => _onLoginTap(context),
                  child: Text(
                    S.of(context).LogIn("female1212"),
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
