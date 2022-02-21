import 'package:flutter/material.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;
  final double? size;

  const StarRating(
      {this.starCount = 5,
      this.rating = .0,
      this.onRatingChanged,
      this.color,
      this.size,
      Key? key})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        size: size ?? 15,
        color: Colors.grey,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: size ?? 15,
        color: color ?? Colors.yellow,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: size ?? 15,
        color: color ?? Colors.yellow,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}
