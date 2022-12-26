import 'package:draivi/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../models/Cars.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCars.cars.length,
      itemBuilder: (ctx, i) => Container(
        margin:
            EdgeInsets.only(top: i.isEven ? 0 : 30, bottom: i.isEven ? 20 : 0),
        decoration: BoxDecoration(
            color: mBackgroundColor,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)]),
        child: Column(
          children: [
            Image.asset(allCars.cars[i].path),
            Text(
              allCars.cars[i].title,
              style: mTitleStyle16,
            ),
            Expanded(
                child: Text(
              (allCars.cars[i].price).toString(),
              style: mTitleStyle,
            )),
            Text("per month")
          ],
        ),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
