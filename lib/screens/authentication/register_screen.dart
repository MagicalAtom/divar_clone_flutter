import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sanjagh/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:sanjagh/components/Loading_component.dart';
import 'package:sanjagh/components/app_bar_component.dart';
import 'package:sanjagh/components/iconsax_icons.dart';
import 'package:sanjagh/components/snack_bar.dart';
import 'package:sanjagh/configs/color_application.dart';
import 'package:sanjagh/configs/fonts_application.dart';
import 'package:sanjagh/configs/size_application.dart';
import 'package:sanjagh/helpers/validation.dart';
import 'package:sanjagh/screens/authentication/login_screen.dart';
import 'package:sanjagh/screens/authentication/widgets/text_form_field_login_register_screen.dart';
import 'package:sanjagh/screens/main/home_screen.dart';
import 'package:sanjagh/widgets/custom_text_widget.dart';
import 'package:sanjagh/widgets/height_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  static const route = '/register';
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        'ثبت نام',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginRegisterTextField(
                        controller: username,
                        hintText: 'نام کاربری',
                        prefixIcon: const Icon(Iconsax.user),
                        validator: NotNullable()),
                    LoginRegisterTextField(
                        controller: email,
                        hintText: 'ایمیل',
                        prefixIcon: const Icon(Icons.mail),
                        validator: EmailValidator()),
                    LoginRegisterTextField(
                        controller: password,
                        hintText: 'رمز عبور',
                        prefixIcon: const Icon(Iconsax.password_check),
                        validator: PasswordValidator()),
                    height(30),
                    BlocConsumer<AuthenticationBloc, AuthenticationState>(
                        listener: (context, state) {
                      if (state is AuthenticationSuccess) {
                        showMessage('ثبت نام با موفقیت انجام شد', context);
                        context.go(HomeScreen.rotue);
                      } else if (state is AuthenticationFailed) {
                        showMessage('ثبت نام انجام نشد', context);
                        email.text = '';
                        password.text = '';
                        username.text = '';
                      }
                    }, builder: (context, state) {
                      if (state is AuthenticationLoading) {
                        return LoadingComponent();
                      } else if (state is AuthenticationInitial) {
                        return Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthenticationBloc>().add(
                                      RegisterEvent(username.text, email.text,
                                          password.text));
                                } else {
                                  showMessage(
                                      'لطفا تمامی فیلد ها را پر کنید', context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.main,
                                  minimumSize: const Size(140, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSize.level1))),
                              child: CustomText(
                                text: 'ثبت نام',
                                fontFamily: Font.name('b'),
                                fontSize: Font.size(2),
                                color: Colors.white,
                              ),
                            ),
                            height(AppSize.level2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'قبلا ثبت نام کرده اید؟ ',
                                  fontFamily: Font.name('b'),
                                  fontSize: Font.size(2),
                                ),
                                GestureDetector(
                                    onTap: () {
                                    context.go(LoginScreen.route);
                                    },
                                    child: CustomText(
                                      text: 'ورود',
                                      fontSize: Font.size(2),
                                      fontFamily: Font.name('b'),
                                      color: AppColor.main,
                                    )),
                              ],
                            )
                          ],
                        );
                      }
                      return const Text('');
                    }),
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
