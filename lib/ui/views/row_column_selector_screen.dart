import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/gen/assets.gen.dart';
import 'package:mobigic_test/ui/widgets/button_widget.dart';

import '../../utils/app_constants.dart';

class RowColumnSelectorScreen extends StatefulWidget {
  const RowColumnSelectorScreen({super.key});

  @override
  State<RowColumnSelectorScreen> createState() => _RowColumnSelectorScreenState();
}

class _RowColumnSelectorScreenState extends State<RowColumnSelectorScreen> {
  int xAxis = 0;
  int yAxis = 0;

  TextEditingController xAxisEditingController = TextEditingController();
  TextEditingController yAxisEditingController = TextEditingController();
  TextEditingController gridTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String getReplacementString() {
    if (gridTextEditingController.text.isNotEmpty) {
      gridTextEditingController.text.substring(gridTextEditingController.text.length - 4);
    }
    return '';
  }

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        Assets.images.word.path,
                        height: 150,
                        width: 150,
                      ),
                      const SizedBox(height: 5),

                      const SizedBox(height: 30),
                      Text(
                        "Enter a value for grid row",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: xAxisEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (int.parse(value) < 1) {
                            return "Required value < 0";
                          }
                          return null;
                        },
                        cursorColor: Theme.of(context).primaryColor,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (int.parse(value) > 0) {
                              xAxis = int.parse(value);
                            }

                            // setState(() {});
                          }
                          if (timer != null) {
                            timer!.cancel();
                          }
                          timer = Timer(const Duration(milliseconds: 600), () {
                            setState(() {});
                          });
                        },
                        decoration: InputDecoration(
                          label: const Text('Row value'),
                          hintText: "Row value",
                          filled: true,
                          fillColor: AppConstants.signinBackground,
                          focusColor: AppConstants.signinBackgroundActive,
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: "Regular",
                            fontSize: 16.0.sp,
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Enter a value for grid column",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14.0,
                            ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: yAxisEditingController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        cursorColor: Theme.of(context).primaryColor,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (int.parse(value) < 1) {
                            return "Required value < 0";
                          }
                          return null;
                        },
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            if (int.parse(value) > 0) {
                              yAxis = int.parse(value);
                            }

                            // setState(() {});
                          }
                          if (timer != null) {
                            timer!.cancel();
                          }
                          timer = Timer(const Duration(seconds: 1), () {
                            setState(() {});
                          });
                        },
                        decoration: InputDecoration(
                          label: const Text('Column value'),
                          hintText: "Column value",
                          filled: true,
                          fillColor: AppConstants.signinBackground,
                          focusColor: AppConstants.signinBackgroundActive,
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: "Regular",
                            fontSize: 16.0.sp,
                          ),
                          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (xAxis > 0 && yAxis > 0)
                        Text(
                          "Enter ${xAxis * yAxis} alphabets for grid",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: 14.0,
                              ),
                        ),
                      const SizedBox(height: 10),
                      if (xAxis > 0 && yAxis > 0)
                        TextFormField(
                          controller: gridTextEditingController,
                          maxLength: xAxis * yAxis,
                          minLines: 1,
                          maxLines: 4,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          textInputAction: TextInputAction.done,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value?.length != xAxis * yAxis) {
                              return 'Please enter all ${xAxis * yAxis} characters ';
                            }
                            return null;
                          },
                          inputFormatters: [
                            // FilteringTextInputFormatter(RegExp(r'^[a-zA-Z]+$'), allow: true, replacementString: getReplacementString()),
                            FilteringTextInputFormatter.allow(AppConstants.nameRegExp),
                          ],
                          cursorColor: Theme.of(context).primaryColor,
                          textAlign: TextAlign.center,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            label: Text('Enter ${xAxis * yAxis} characters'),
                            hintText: 'Enter ${xAxis * yAxis} characters',
                            filled: true,
                            fillColor: AppConstants.signinBackground,
                            focusColor: AppConstants.signinBackgroundActive,
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: "Regular",
                              fontSize: 16.0.sp,
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      // const Spacer(),
                      const SizedBox(height: 10),
                      ButtonWidget(
                        type: ButtonType.primary,
                        title: "Continue",
                        onTap: (xAxis > 0 && yAxis > 0)
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  Get.offNamed("/boardScreen", arguments: {"message": gridTextEditingController.text.toLowerCase(), "xAxis": xAxis, "yAxis": yAxis});
                                }
                              }
                            : null,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
