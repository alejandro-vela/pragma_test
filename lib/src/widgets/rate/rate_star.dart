import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../theme/colors.dart';

class RateStar extends StatelessWidget {
  final int rate;
  final String item;
  const RateStar({
    super.key,
    required this.rate,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RatingBar.builder(
            initialRating: double.parse(rate.toString()),
            direction: Axis.horizontal,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 25,
            itemPadding: EdgeInsets.symmetric(horizontal: 4),
            unratedColor: AppColors.secondaryColor.withOpacity(0.3),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            onRatingUpdate: (_) {},
          ),
        ],
      ),
    );
  }
}
