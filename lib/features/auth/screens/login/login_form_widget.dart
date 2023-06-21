import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/login_controller.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/forget_password/forget_password_button_widget.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/forget_password/forget_password_mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /// input form controller
  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  /// rive controller and input
  StateMachineController? bearController;

  SMIInput<bool>? isChecking;

  SMIInput<double>? numLook;

  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;

  SMIInput<bool>? trigFail;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child: RiveAnimation.asset(
            "assets/animations/login-teddy.riv",
            fit: BoxFit.fitHeight,
            stateMachines: const ["Login Machine"],
            onInit: (artboard) {
              bearController = StateMachineController.fromArtboard(
                artboard,

                /// from rive, you can see it in rive editor
                "Login Machine",
              );
              if (bearController == null) return;

              artboard.addController(bearController!);
              isChecking = bearController?.findInput("isChecking");
              numLook = bearController?.findInput("numLook");
              isHandsUp = bearController?.findInput("isHandsUp");
              trigSuccess = bearController?.findInput("trigSuccess");
              trigFail = bearController?.findInput("trigFail");
            },
          ),
        ),
        Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  controller: controller.email,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: tEmail,
                      hintText: tEmail,
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: tFormHeight - 20),
                TextFormField(
                  focusNode: passwordFocusNode,
                  controller: controller.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: tPassword,
                    hintText: tPassword,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: null,
                      icon: Icon(Icons.remove_red_eye_sharp),
                    ),
                  ),
                ),
                const SizedBox(height: tFormHeight - 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          builder: (context) => Container(
                            padding: const EdgeInsets.all(tDefaultSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tForgetPasswordTitle, style: Theme.of(context).textTheme.displayMedium),
                                Text(tForgetPasswordSubTitle, style: Theme.of(context).textTheme.bodyMedium),
                                const SizedBox(height: 30.0),
                                ForgetPasswordButtonWidget(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Get.to(() => const ForgetPasswordMailScreen());
                                  },
                                  title: tEmail,
                                  subTitle: tResetViaEMail,
                                  btnIcon: Icons.mail_outline_rounded,
                                ),
                                const SizedBox(height: 20.0),
                                ForgetPasswordButtonWidget(
                                  onTap: () {},
                                  title: tPhoneNo,
                                  subTitle: tResetViaPhone,
                                  btnIcon: Icons.mobile_friendly_rounded,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Text(tForgetPassword)),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      emailFocusNode.unfocus();
                      passwordFocusNode.unfocus();
                      if (formKey.currentState!.validate()) {
                        LoginController.instance.login();
                      }
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
