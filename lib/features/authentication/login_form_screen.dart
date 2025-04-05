import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/features/authentication/view_models/login_view_model.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class LoginFormScreen extends ConsumerStatefulWidget {
  const LoginFormScreen({super.key});
  final String emailKey = "Email";
  final String passwordKey = "Password";

  @override
  LoginFormScreenState createState() => LoginFormScreenState();
}

class LoginFormScreenState extends ConsumerState<LoginFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formkey.currentState != null) {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              formData[widget.emailKey]!,
              formData[widget.passwordKey]!,
              context,
            );
        //context.goNamed(InterestsScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData[widget.emailKey] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      formData[widget.passwordKey] = newValue;
                    }
                  }),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: FormButton(disabled: ref.watch(loginProvider).isLoading),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
