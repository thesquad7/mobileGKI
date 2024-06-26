import 'package:MobileGKI/utils/constrains/colorhandler.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';

class FHorizontalCardImgBG extends StatelessWidget {
  const FHorizontalCardImgBG(
      {super.key,
      required this.imgUrl,
      required this.judul,
      required this.category,
      this.color_id = 1,
      required this.author,
      this.padding = const EdgeInsets.all(8.0)});
  final String imgUrl, judul, category, author;
  final int color_id;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Card(
          elevation: 6,
          child: Stack(children: [
            Container(
                width: double.infinity,
                height: 150,
                child: ClipRRect(
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(10))),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: CategoryColorHandler.categorycolor[color_id]
                      .withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: CategoryColorHandler.categorycolor[color_id]
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                width: 100,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      category,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 10,
              child: Container(
                width: FilemonHelperFunctions.screenWidth() * 0.72,
                child: Text(
                  judul,
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              child: Container(
                width: FilemonHelperFunctions.screenWidth() * 0.8,
                height: 30,
                child: Text(
                  author,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ])),
    );
  }
}
