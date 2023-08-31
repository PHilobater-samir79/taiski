class OnBoardingModel {
  String imagePath;
  String title;
  String subTitle;
  String nextBottom;
  String backBottom;

  OnBoardingModel(
      {required this.title,
      required this.imagePath,
      required this.subTitle,
      required this.nextBottom,
      required this.backBottom});

  static List<OnBoardingModel> onBoardingScreens = [
    OnBoardingModel(
        title: 'Manage your tasks',
        imagePath: 'assets/images/onBoarding1.png',
        subTitle:
            'You can easily manage all of your daily\n tasks in Done for free',
        backBottom: '',
        nextBottom: 'Next'),
    OnBoardingModel(
        title: 'Create daily routine',
        imagePath: 'assets/images/onBoarding2.png',
        subTitle:
            'In Taiski  you can create your\n personalized routine to stay productive',
        backBottom: 'Back',
        nextBottom: 'Next'),
    OnBoardingModel(
        title: 'Organizing your tasks',
        imagePath: 'assets/images/onBoarding3.png',
        subTitle:
            'You can organize your daily tasks by\n adding your tasks into separate categories',
        backBottom: 'Back',
        nextBottom: 'Get Started')
  ];
}
