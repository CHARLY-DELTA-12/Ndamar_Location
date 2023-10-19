import 'package:flutter/material.dart';

class CarItem extends StatelessWidget {
  final String name;
  final String distance;
  final String price;
  final String imagePath;

  const CarItem({
    Key? key,
    required this.name,
    required this.distance,
    required this.price,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  width: 55.0,
                  height: 55.0,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xFFF34848),
                      size: 20.0,
                    ),
                    Text(
                      distance,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Color(0xFF36A736),
                      size: 20.0,
                    ),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
