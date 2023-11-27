import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:truck_delivery_customer/constant/app_colors.dart';
import 'package:truck_delivery_customer/controller/loginController.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: Form(
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ...[
                    TextFormField(
                      controller: loginController.emailController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Số điện thoại',
                      ),
                      onChanged: (value) {
                        // formData.phone = value;
                      },
                    ),
                    TextFormField(
                      controller: loginController.passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Mật khẩu',
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        // formData.password = value;
                      },
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: AppColors.transparent))),
                        backgroundColor: MaterialStatePropertyAll(AppColors.buttonColor),
                      ),
                      child: const Text('Đăng Nhập', style: TextStyle(color: Colors.black)),
                      onPressed: () => loginController.loginWithEmail(),
                    ),
                  ].expand(
                        (widget) => [
                      widget,
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),)
    );
  }
}
