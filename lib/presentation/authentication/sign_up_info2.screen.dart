import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvie/core/components/buttons/direction_buttons.widget.dart';
import 'package:marvie/core/theme/colors.dart';
import 'package:marvie/core/theme/text_styles.dart';

import 'authentication_header.widget.dart';

class SignUpInfo2Screen extends StatefulWidget {
  const SignUpInfo2Screen({Key? key}) : super(key: key);

  @override
  State<SignUpInfo2Screen> createState() => _SignUpInfo2ScreenState();
}

class _SignUpInfo2ScreenState extends State<SignUpInfo2Screen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: darkGreenGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, top: 90, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthenticationHeader(
                    title: 'Sign up',
                    content: 'to start working',
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                            color: green50d,
                            borderRadius: BorderRadius.circular(12)),
                        child: CountryCodePicker(
                            textStyle: whiteLargeBodyStyle,
                            dialogTextStyle: whiteLargeBodyStyle,
                            onChanged: print,
                            initialSelection: '+98',
                            favorite: const ['+98', '+1'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                            closeIcon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            boxDecoration: const BoxDecoration(
                              gradient: darkGreenGradient,
                            ),
                            searchStyle: whiteLargeBodyStyle,
                            searchDecoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 1),
                                ))),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          cursorColor: green300d,
                          style: darkGreenInputStyle,
                          decoration: const InputDecoration(
                            hintText: "935 336 1996",
                            hintStyle: darkGreenInputStyle,
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black12, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black26, width: 1),
                            ),
                            // suffixIcon: Icon(Icons.visibility)
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  DirectionButtons(
                      onNextPress: () {},
                      onPreviousPress: () {
                        Get.back();
                      }),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
