import 'package:flutter/material.dart';

class FManagementPageDesign extends StatelessWidget {
  const FManagementPageDesign({
    super.key,
    required this.pageTitle,
    this.floatAButton = false,
    required this.itemCount,
    required this.autokeepalive,
    this.search,
    required this.searchbutton,
    required this.child,
  });
  final int itemCount;
  final String pageTitle;
  final IconButton? search;
  final bool floatAButton, autokeepalive, searchbutton;
  final NullableIndexedWidgetBuilder child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: searchbutton ? [search!] : null,
      ),
      floatingActionButton: floatAButton
          ? FloatingActionButton.small(
              child: const Icon(Icons.add), onPressed: () {})
          : null,
      body: Center(
        child: ListView.builder(
            addAutomaticKeepAlives: autokeepalive,
            itemCount: itemCount,
            itemBuilder: child),
      ),
    );
  }
}
