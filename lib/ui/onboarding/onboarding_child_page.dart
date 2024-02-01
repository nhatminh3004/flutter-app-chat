//Đóng vai trò giao diện màn hình
import 'package:flutter/material.dart';
import 'package:myflutter/ultils/enum/onboarding_page_position.dart';

class OnboardingChildPage extends StatelessWidget {
  final VoidCallback backPressed;
  final VoidCallback skipPressed;
  final VoidCallback nextOnPressed;
  final OnboardingPagePosition onboardingPagePosition;
  const OnboardingChildPage(
      {super.key,
      required this.onboardingPagePosition,
      required this.nextOnPressed,
      required this.skipPressed,
      required this.backPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSkipButton(),
                _buildOnboardingImage(),
                _buildOnboardingPageControl(),
                SizedBox(
                  height: 50,
                ),
                _buildOnboardingTitleAndContent(),
                _buildOnboardingNextAndBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Container(
      // color: Colors.black,
      alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsets.only(
        left: 24,
        top: 14,
      ),
      child: TextButton(
        onPressed: () {
          skipPressed();
        },
        // style: TextButton.styleFrom(backgroundColor: Colors.red),
        child: Text(
          'Bỏ qua',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.44),
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingImage() {
    return Image.asset(
      onboardingPagePosition.onboardingPageImage(),
      height: 296,
      width: 271,
    );
  }

  Widget _buildOnboardingPageControl() {
    return Container(
      margin: const EdgeInsets.only(top: 51),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page1
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(56),
            ),
            height: 4,
            width: 26,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page2
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(56),
            ),
            height: 4,
            width: 26,
          ),
          Container(
            decoration: BoxDecoration(
              color: onboardingPagePosition == OnboardingPagePosition.page3
                  ? Colors.red
                  : Colors.white,
              borderRadius: BorderRadius.circular(56),
            ),
            height: 4,
            width: 26,
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingTitleAndContent() {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            child: Text(
              textAlign: TextAlign.center,
              onboardingPagePosition.onboardingPageTitle(),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF).withOpacity(0.87),
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            // color: Colors.red,
            margin: EdgeInsets.only(top: 50, left: 38, right: 38),
            // color: Colors.red,
            // padding: EdgeInsets.symmetric(horizontal: 38),
            child: Text(
              textAlign: TextAlign.center,
              onboardingPagePosition.onboardingPageContent(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color(0xFFFFFFFF).withOpacity(0.87),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOnboardingNextAndBackButton() {
    return Container(
      margin: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 50,
        bottom: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              backPressed();
            },
            child: Text(
              'Quay lại ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.44),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color(0xFF8875FF)),
            onPressed: () {
              nextOnPressed();
            },
            child: Text(
              onboardingPagePosition.onboardingButtonFinal(),
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
          ),
        ],
      ),
    );
  }
}
