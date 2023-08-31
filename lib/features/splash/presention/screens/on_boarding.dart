import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do/features/splash/data/on_boarding_model.dart';
import 'package:to_do/features/tasks/presention/screens/home_screen.dart';

class onBoardingScreen extends StatelessWidget {
  static const String routeName = 'onBoardingScreen';
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: OnBoardingModel.onBoardingScreens.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.jumpToPage(2);
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.acme(
                                color: Colors.grey[400],
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                            child: Image.asset(
                          OnBoardingModel.onBoardingScreens[index].imagePath,
                          height: 300,
                          width: 300,
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xff242969),
                              dotHeight: 8,
                              dotColor: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                            child: Text(
                          OnBoardingModel.onBoardingScreens[index].title,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 35),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          OnBoardingModel.onBoardingScreens[index].subTitle,
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(
                          height: 150,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.previousPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.fastEaseInToSlowEaseOut);
                              },
                              child: Text(
                                OnBoardingModel
                                    .onBoardingScreens[index].backBottom,
                                style: GoogleFonts.acme(
                                    color: Colors.grey[400],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                  onPressed: () {
                                    index == 2
                                        ? Navigator.pushNamed(
                                            context, homeScreen.routeName)
                                        : controller.nextPage(
                                            duration:
                                                Duration(milliseconds: 1000),
                                            curve:
                                                Curves.fastEaseInToSlowEaseOut);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff242969),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      OnBoardingModel
                                          .onBoardingScreens[index].nextBottom,
                                      style: GoogleFonts.acme(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
