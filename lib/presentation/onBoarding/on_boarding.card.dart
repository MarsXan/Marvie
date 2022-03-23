import 'package:flutter/material.dart';
import 'package:marvie/core/theme/dimentions.dart';
import 'package:marvie/core/theme/text_styles.dart';
import 'package:marvie/presentation/onBoarding/oboarding.model.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({Key? key, required this.onBoardingModel})
      : super(key: key);
  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(cardBorderRadius),
            child: Image(
              image: AssetImage(onBoardingModel.image),
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.width > 400 ? 390 : 330,
            ),
          ),
          const SizedBox(height: 38),
          Text(
            onBoardingModel.title,
            style: largeTitleStyle,
          ),
          const SizedBox(height: 8),
          SizedBox(
              width: 265,
              child: Text(
                onBoardingModel.desc,
                style: darkGreenContent,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
