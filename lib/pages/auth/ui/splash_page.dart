import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/app/resources/slider_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slides = [
      Slide(
        title: SliderStrings.firstSlide,
        description: SliderStrings.firstSlideDescription,
        backgroundColor: Colors.green,
      ),
      Slide(
        title: SliderStrings.secondSlide,
        description: SliderStrings.secondSlideDescription,
        backgroundColor: Colors.red,
      ),
      Slide(
        title: SliderStrings.thirdSlide,
        description: SliderStrings.thirdSlideDescription,
        backgroundColor: Colors.deepOrange,
      ),
      Slide(
        title: SliderStrings.fourthSlide,
        description: SliderStrings.fourthSlideDescription,
        colorBegin: Colors.blue,
        colorEnd: Colors.indigo,
      ),
    ];
    return IntroSlider(
      slides: slides,
      onDonePress: () => Navigation.instance
          .pushAndRemoveUntil(SharedRoutes.signIn, (route) => false),
    );
  }
}
