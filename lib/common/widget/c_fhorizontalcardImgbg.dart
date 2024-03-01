import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class FHorizontalCardImgBG extends StatelessWidget {
  const FHorizontalCardImgBG({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 6,
          child: Stack(children: [
            Container(
                width: double.infinity,
                height: 150,
                child: ClipRRect(
                    child: Image.asset(
                      Filemonimages.pendeta1,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(10))),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text("Categori"),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 10,
              child: Container(
                width: 100,
                child: Text(
                  "Judul",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Container(
                width: 100,
                child: Text(
                  "Author",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            )
          ])),
    );
  }
}
