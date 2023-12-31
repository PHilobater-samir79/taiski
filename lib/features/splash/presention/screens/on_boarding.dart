import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do/core/local_Data/catch_helper.dart';
import 'package:to_do/core/service/services_locator.dart';
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
                            OnBoardingModel.onBoardingScreens[index].skip,
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
                          height: 250,
                          width: 250,
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
                              fontSize: 30),
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
                              fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                        Spacer(),
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
                                  onPressed: () async {
                                    var dataSaved = await getIt<CacheHelper>()
                                        .setData(key: 'isVisited', value: true)
                                        .then((value) {
                                      index == 2
                                          ? Navigator.pushReplacementNamed(
                                              context, homeScreen.routeName)
                                          : controller.nextPage(
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              curve: Curves
                                                  .fastEaseInToSlowEaseOut);
                                    });
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
