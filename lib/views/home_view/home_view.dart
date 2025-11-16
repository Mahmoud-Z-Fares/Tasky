import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky/utils/consts.dart';
import 'package:tasky/views/auth/login_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<HomeViewArgs> homeViewArgs = [
    HomeViewArgs(
      title: "Manage your tasks",
      subtitle:
          "You can easily manage all of your daily tasks in DoMe for free",
      picPath: pageOneImage,
    ),
    HomeViewArgs(
      title: "Create daily routine",
      subtitle:
          "In Tasky you can create your personalized routine to stay productive",
      picPath: pageTwoImage,
    ),
    HomeViewArgs(
      title: "Organize your tasks",
      subtitle:
          "You can organize your daily tasks by adding your tasks into separate categories",
      picPath: pageThreeImage,
    ),
  ];

  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: PageView.builder(
                  itemCount: homeViewArgs.length,
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, inde) {
                    return Image.asset(
                      homeViewArgs[inde].picPath,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              SmoothPageIndicator(
                controller: controller,
                count: homeViewArgs.length,
                effect: WormEffect(dotHeight: 5, dotWidth: 30),
                onDotClicked: (i) {
                  controller.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease,
                  );
                },
              ),

              const SizedBox(height: 20),

              Text(
                homeViewArgs[index].title,
                style: styleBlack32W700,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                homeViewArgs[index].subtitle,
                style: styleBlack16W400.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    if (index == homeViewArgs.length - 1) {
                      Navigator.of(context).pushNamed(LoginView.routeName);
                    } else {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(12),
                  color: mainColor,
                  child: Text(
                    index == homeViewArgs.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeViewArgs {
  HomeViewArgs({
    required this.title,
    required this.subtitle,
    required this.picPath,
  });

  final String title;
  final String subtitle;
  final String picPath;
}
