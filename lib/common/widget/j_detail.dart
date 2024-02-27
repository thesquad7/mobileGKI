import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:MobileGKI/home/d_config/widget/b_appbar.dart';
import 'package:flutter/material.dart';

class FDetailJadwal extends StatelessWidget {
  const FDetailJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          FilemonPrimaryHeaderCon(
              height: 200,
              child: Stack(children: [
                Container(
                  height: 50,
                  color: Colors.red,
                )
              ]),
              color: Colors.purpleAccent)
        ]),
      ),
    );
  }
}
