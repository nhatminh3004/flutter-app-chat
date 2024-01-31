enum OnboardingPagePosition {
  page1,
  page2,
  page3,
}

extension OnboardingPagePositionExtension on OnboardingPagePosition {
  // hàm trả về image cho 3 page
  String onboardingPageImage() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "assets/images/onboarding_1.png";
      case OnboardingPagePosition.page2:
        return "assets/images/onboarding_3.png";
      case OnboardingPagePosition.page3:
        return "assets/images/onboarding_2.png";
    }
  }

  String onboardingPageTitle() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return "Tiết kiệm thời gian";
      case OnboardingPagePosition.page2:
        return "Theo dõi tiến độ";
      case OnboardingPagePosition.page3:
        return "Quản lý dễ dàng";
    }
  }

  String onboardingPageContent() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'Bạn có thể tiết kiệm thời gian dễ dàng các công việc của mình '
            'một cách linh hoạt và hiệu quả';
      case OnboardingPagePosition.page2:
        return 'Bạn có thể dễ dàng theo dõi tiến độ các công việc của mình '
            'một cách linh hoạt và hiệu quả';
      case OnboardingPagePosition.page3:
        return 'Bạn có thể dễ dàng quản lý các công việc của mình '
            'một cách linh hoạt và hiệu quả';
    }
  }

  String onboardingButtonFinal() {
    switch (this) {
      case OnboardingPagePosition.page1:
        return 'Tiếp theo';
      case OnboardingPagePosition.page2:
        return 'Tiếp theo';
      case OnboardingPagePosition.page3:
        return 'Bắt đầu ngay';
    }
  }
}
