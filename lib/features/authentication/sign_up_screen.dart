import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../generated/l10n.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
    print("user came back");
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UsernameScreen(),
      ),
    );
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
                    style: GoogleFonts.abrilFatface(
                      textStyle: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
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
