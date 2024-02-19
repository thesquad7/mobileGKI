import 'package:MobileGKI/common/widget/c_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FilemonPrimaryHeaderCon(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
