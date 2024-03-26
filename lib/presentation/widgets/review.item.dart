
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final String review;
  final double rating;
  final DateTime dateTime;

  const ReviewItem({
    super.key,
    required this.review,
    required this.rating,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review),
          4.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rating: $rating'),
              Text(
                'Date: ${DateFormat.yMMMEd().format(dateTime)}',
              ), // Format dateTime as needed
            ],
          ),
        ],
      ),
    );
  }
}