import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Your personal sustainability tracker",
        styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        pathImage: "https://i.imgur.com/B5fctzw.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Be self-aware of your lifestyle",
        styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        pathImage: "https://i.imgur.com/K6n9MiK.jpg",
      ),
    );
    slides.add(
      new Slide(
        title: "Take action against climate change",
        styleTitle: TextStyle(
          color: Colors.black54,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        pathImage: "https://i.imgur.com/nhEyJ6x.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.of(context).pushNamed('/user');
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    child: Image.network(
                  currentSlide.pathImage,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.contain,
                )),
                Container(
                  child: Text(
                    currentSlide.title,
                    style: currentSlide.styleTitle,
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Colors.black54,
      highlightColorSkipBtn: Colors.black,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.black54,
      highlightColorDoneBtn: Colors.black,

      // Dot indicator
      colorDot: Colors.black54,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.DOT_MOVEMENT,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
