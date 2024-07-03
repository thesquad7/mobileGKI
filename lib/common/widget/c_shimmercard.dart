import 'package:MobileGKI/common/widget/c_shimmerplaceholder.dart';
import 'package:MobileGKI/utils/helper/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FShimmerCard extends StatelessWidget {
  const FShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 230,
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShimmerPlacehoder(
                    height: 50,
                    width: 50,
                  ),
                  ShimmerPlacehoder(
                    height: 50,
                    width: 50,
                  ),
                  ShimmerPlacehoder(
                    height: 50,
                    width: 50,
                  ),
                  ShimmerPlacehoder(
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ShimmerPlacehoder(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}

class FCarosel extends StatelessWidget {
  const FCarosel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 200,
        width: FilemonHelperFunctions.screenWidth(),
        child: Stack(
          children: [
            Positioned(
              top: 140,
              left: 10,
              child: ShimmerPlacehoder(
                height: 30,
                width: FilemonHelperFunctions.screenWidth() * 0.83,
              ),
            ),
            Positioned(
              bottom: 35,
              left: 10,
              child: ShimmerPlacehoder(
                height: 10,
                width: FilemonHelperFunctions.screenWidth() * 0.43,
              ),
            ),
            Positioned(
              top: 15,
              right: 10,
              child: ShimmerPlacehoder(
                height: 20,
                width: FilemonHelperFunctions.screenWidth() * 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FShimmerVerticalCard extends StatelessWidget {
  const FShimmerVerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 230,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            ShimmerPlacehoder(
              height: 160,
              width: 160,
            ),
            ShimmerPlacehoder(
              height: 5,
            ),
            ShimmerPlacehoder(
              height: 5,
              width: 40,
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
