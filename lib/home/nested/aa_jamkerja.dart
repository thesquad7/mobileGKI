import 'package:MobileGKI/common/widget/c_fmanagementpage.dart';
import 'package:flutter/material.dart';

class JamKerja extends StatelessWidget {
  const JamKerja({super.key});

  @override
  Widget build(BuildContext context) {
    return FManagementPageDesign(
        searchbutton: false,
        child: (_, index) {
          return Container(
            width: double.infinity,
            height: 80,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    child: Text("Senin"),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        child: Text("Start"),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 40,
                        child: Text("End"),
                      )
                    ],
                  )
                ],
              ),
              elevation: 6,
            ),
          );
        },
        pageTitle: "Jam Kerja",
        itemCount: 7,
        autokeepalive: true);
  }
}
