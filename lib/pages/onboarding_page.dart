import 'package:flutter/material.dart';
import 'package:kitchen_room_world/utils/routes.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController pageController;
  int index = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      this.index = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardingContent(
                    image: data[index % data.length].image,
                    title: data[index % data.length].title,
                    description: data[index % data.length].description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    ...List.generate(
                      data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: IndicatorBar(
                          isActive: index == this.index % data.length,
                          index: this.index,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        height: 56,
                        width: 56,
                        child: buildAnimatedSwitcher(
                          ElevatedButton(
                              key: const ValueKey<int>(1),
                              onPressed: () {
                                pageController.nextPage(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.easeInOutSine);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.deepOrange),
                              child: const Icon(Icons.arrow_forward_rounded)),
                          ElevatedButton(
                              key: const ValueKey<int>(2),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.homePageRoute);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              child: const Icon(Icons.done)),
                        )),
                    const Spacer(),
                    buildAnimatedSwitcher(
                      buildInkWell("Skip", 1),
                      buildInkWell("Done", 2),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildInkWell(String textData, int state) {
    return InkWell(
      key: ValueKey<int>(state),
      onTap: () {
        Navigator.pushNamed(context, Routes.homePageRoute);
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 70,
        height: 50,
        alignment: Alignment.center,
        child: Text(
          textData,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: (index != data.length - 1)
                  ? Colors.deepOrange
                  : Colors.green),
        ),
      ),
    );
  }

  AnimatedSwitcher buildAnimatedSwitcher(Widget a, Widget b) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      child: (index != data.length - 1) ? a : b,
    );
  }
}

// Internal Classes

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> data = [
  Onboard(
    image: "assets/images/onboarding_page/onb1.png",
    title: "Want to learn how to cook !",
    description: "Here you will find all the necessary recipe with step by "
        "step guideline so that you can also become a great cook !",
  ),
  Onboard(
    image: "assets/images/onboarding_page/onb2.png",
    title: "Practice to upgrade your skills !",
    description: "Here you will find all the necessary recipe with step by "
        "step guideline so that you can also become a great cook !",
  ),
  Onboard(
    image: "assets/images/onboarding_page/onb3.png",
    title: "And become a master chef !",
    description: "Here you will find all the necessary recipe with step by "
        "step guideline so that you can also become a great cook !",
  ),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(image),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w500, fontFamily: "Poppins"),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            description,
            style: const TextStyle(
                fontFamily: "Poppins", fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class IndicatorBar extends StatelessWidget {
  const IndicatorBar({
    super.key,
    this.isActive = false,
    required this.index,
  });

  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 10 : 4,
      width: 3,
      decoration: BoxDecoration(
        color: (index != data.length - 1) ? Colors.deepOrange : Colors.green,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(2),
      ),
      duration: const Duration(milliseconds: 500),
    );
  }
}
