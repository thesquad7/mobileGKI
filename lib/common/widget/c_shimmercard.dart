import 'package:MobileGKI/common/widget/c_shimmerplaceholder.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShimmerPlacehoder(
                  height: 60,
                  width: 60,
                ),
                ShimmerPlacehoder(
                  height: 60,
                  width: 60,
                ),
                ShimmerPlacehoder(
                  height: 60,
                  width: 60,
                ),
                ShimmerPlacehoder(
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            ShimmerPlacehoder(
              height: 160,
            )
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
            )
          ],
        ),
      ),
    );
  }
}
