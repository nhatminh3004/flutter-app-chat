//class cha có vai trò quản lý các class con , di chuyển qua lại các class con
import 'package:flutter/material.dart';
import 'package:myflutter/ui/onboarding/onboarding_child_page.dart';
import 'package:myflutter/ui/welcomescreen/welcome_screen_page.dart';

import 'package:myflutter/ultils/enum/onboarding_page_position.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //ngăn khng cho vuốt
        controller: _pageController,
        children: [
          //chuyền vào các widget con mà muốn page view hiển thị
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page1,
            nextOnPressed: () {
              _pageController.jumpToPage(1);
            },
            skipPressed: () {
              _pageController.jumpToPage(3);
            },
            backPressed: () {
              _pageController.jumpToPage(0);
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page2,
            nextOnPressed: () {
              _pageController.jumpToPage(2);
            },
            skipPressed: () {
              _pageController.jumpToPage(3);
            },
            backPressed: () {
              _pageController.jumpToPage(0);
            },
          ),
          OnboardingChildPage(
            onboardingPagePosition: OnboardingPagePosition.page3,
            nextOnPressed: () {
              _pageController.jumpToPage(3);
            },
            skipPressed: () {
              _pageController.jumpToPage(3);
            },
            backPressed: () {
              _pageController.jumpToPage(1);
            },
          ),
          WelcomeScreenPage(
            backPressed: () {
              _pageController.jumpToPage(2);
            },
            getStartedPressed: () {
              _pageController.jumpToPage(0);
            },
          )
        ],
      ),
    );
  }
}
