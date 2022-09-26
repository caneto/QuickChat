import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/controllers/auth_controller.dart';
import 'package:demo_application/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key}) : super(key: key);

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: letsconnect.text.black.fontFamily(bold).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value!.isEmpty || value.length < 6) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: lightgrenColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: lightgrenColor),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: btnColor,
                          ),
                          hintText: "ex. Charles",
                          labelText: "Username",
                          labelStyle: const TextStyle(
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    10.heightBox,
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if(value!.isEmpty || value.length < 9) {
                          return "Please enter your phone number";
                        }
                        return null;
                      },
                      controller: controller.phoneController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: lightgrenColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: lightgrenColor),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone_android_rounded,
                            color: btnColor,
                          ),
                          //prefixText: "+55",
                          hintText: " ex: 21 999999999",
                          labelText: "Phone Number",
                          labelStyle: const TextStyle(
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              otp.text.semiBold.size(16).make(),
              //otpField
              Obx(() => Visibility(
                    visible: controller.isOptSent.value,
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => SizedBox(
                            width: 56,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: controller.otpController[index],
                              cursorColor: btnColor,
                              onChanged: (value) {
                                if (value.length == 1 && index <= 5) {
                                  FocusScope.of(context).nextFocus();
                                } else if (value.isEmpty && index > 0) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              style: const TextStyle(
                                fontFamily: bold,
                                color: btnColor,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: bgColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        const BorderSide(color: bgColor),
                                  ),
                                  hintText: "*"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.screenWidth - 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () async {
                      if(controller.formKey.currentState!.validate()) {
                        if (controller.isOptSent.value == false) {
                          controller.isOptSent.value = true;
                          await controller.sendOpt();
                        } else {
                          controller.verifyOtp(context);
                        }
                      }
                      //Get.to(() => HomeScreen(), transition: Transition.downToUp);
                    },
                    child: continueText.text.semiBold.size(16).make(),
                  ),
                ),
              ),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
