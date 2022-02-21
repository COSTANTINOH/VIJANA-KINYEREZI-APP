import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/widget/index.dart';

class ProductCard extends StatelessWidget {
  final Color color;
  final double elevation;
  final Color shadowColor;
  final ShapeBorder shapeBorder;
  final String productImage;
  final double productRating;
  final String productName;
  final String productPrice;
  final String productSales;
  final double height;
  final double width;

  const ProductCard(
      {Key? key,
      required this.height,
      required this.width,
      required this.color,
      required this.elevation,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productRating,
      required this.productSales,
      required this.shadowColor,
      required this.shapeBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: color,
      shadowColor: shadowColor,
      shape: shapeBorder,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: ImagePreview(
              img: productImage,
              height: 79,
              width: 109,
            ),
          ),
          jtmanualStepper(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.star,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.star_border,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.star_border,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                Icon(
                  Icons.star_border,
                  size: 10,
                  color: Theme.of(context).primaryColor,
                ),
                jtmanualSpacer(),
                Text(
                  "(" + productRating.toString() + ")",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
          jtmanualStepper(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                productName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          jtmanualStepper(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  productPrice,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "(" + productSales + ")",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
