import 'dart:io';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/providers/auth/supabase_auth_provider.dart';
import 'package:voting_app/constants/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';
import 'package:voting_app/widgets/krapi_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SupabaseAuthProvider provider;

  @override
  void initState() {
    provider = SupabaseAuthProvider();

    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColour,
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Center(
            child: SizedBox(
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: IconButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            File file = File(result.files.single.path!);
                            await provider.updateProfilePic(file);
                            imageCache.clear();
                            imageCache.clearLiveImages();
                            setState(() {});
                          }
                        },
                        splashRadius: 50,
                        icon: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(provider
                                  .currentUser.profilePicUrl ??
                              'https://www.kindacode.com/wp-content/uploads/2022/07/lemon.png'),
                        ),
                      ),
                    ),
                    Text(
                      provider.currentUser.name,
                      style: logoTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    KrapiTextField(
                      upperLabel: "Your Election ID:",
                      labelTextStyle: labelTextStyle2,
                      textField: TextField(
                        obscureText: false,
                        enabled: false,
                        decoration: InputDecoration(
                          fillColor: fillColour2,
                          hintText: provider.currentUser.electionid,
                          hintStyle: hintTextStyle2,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: KrapiTextField(
                            upperLabel: "Your Role:",
                            labelTextStyle: labelTextStyle2,
                            textField: TextField(
                              obscureText: false,
                              enabled: false,
                              decoration: InputDecoration(
                                fillColor: fillColour2,
                                hintText:
                                    "#${EnumToString.convertToString(provider.currentUser.role)}",
                                hintStyle: hintTextStyle2,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          flex: 1,
                          child: KrapiTextField(
                            upperLabel: "Vote wallet:",
                            labelTextStyle: labelTextStyle2,
                            textField: TextField(
                              obscureText: false,
                              enabled: false,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                fillColor: fillColour2,
                                hintText: "1",
                                hintStyle: hintTextStyle2,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    KrapiTextButton(text: "Candidate List", onTap: () {}),
                    const SizedBox(height: 10),
                    KrapiTextButton(text: "View Dashboard", onTap: () {}),
                    const SizedBox(height: 10),
                    KrapiTextButton(text: "Settings", onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
