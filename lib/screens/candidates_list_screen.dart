import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voting_app/constants/colours.dart';
import 'package:voting_app/user.dart';
import 'package:voting_app/widgets/candidate_list.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

import '../providers/auth/supabase_auth_provider.dart';

class CandidatesListScreen extends StatelessWidget {
  CandidatesListScreen({super.key});
  final SupabaseAuthProvider provider = SupabaseAuthProvider();

  Future<List<KrapiUser>> fetchCandidates() async {
    final rows = await Supabase.instance.client
        .from("users")
        .select<List<Map<String, dynamic>>>("*")
        .match({"role": "candidate"});
    if (rows.isEmpty) {
      print("fffffffff");
    }

    final candidatesList = rows.map((row) => KrapiUser.fromMap(row));

    return candidatesList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColour,
      body: FutureBuilder(
        future: fetchCandidates(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: CandidateList(
                            profilePic: snapshot.data![index].profilePicUrl ??
                                "https://www.kindacode.com/wp-content/uploads/2022/07/lemon.png'",
                            candidateName: snapshot.data![index].name,
                            button1: KrapiTextButton(
                              text: "Election Campaign",
                              onTap: () {},
                              width: 400,
                            ),
                            button2: KrapiTextButton(
                              text: "Vote",
                              onTap: () {},
                              width: 400,
                            )),
                      );
                    });
              } else {
                //TODO Handle there are no candidates
                return CircularProgressIndicator();
              }
            default:
              //TODO Fix the progress indicator
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
