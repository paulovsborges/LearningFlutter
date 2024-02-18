class OnBoardingData {
  const OnBoardingData({
    required this.label,
    required this.description,
    required this.screenshots,
  });

  final String label;
  final String description;
  final List<String> screenshots;

  static const firstStep = OnBoardingData(
    label: 'Universal data storage',
    description:
        'Relieve yourself of creating and \nmemorizing complex passwords on your own with Locktap',
    screenshots: [
      'assets/images/onboarding/first_step/img_onboarding_1_1.png',
      'assets/images/onboarding/first_step/img_onboarding_1_2.png',
      'assets/images/onboarding/first_step/img_onboarding_1_3.png',
      'assets/images/onboarding/first_step/img_onboarding_1_4.png',
    ],
  );

  static const secondStep = OnBoardingData(
    label: 'Security hardened',
    description:
        'All your data is securely password \nprotected. You can also set access \nonly by face ID',
    screenshots: [
      'assets/images/onboarding/second_step/img_onboarding_2_1.png',
      'assets/images/onboarding/second_step/img_onboarding_2_2.png',
      'assets/images/onboarding/second_step/img_onboarding_2_3.png',
      'assets/images/onboarding/second_step/img_onboarding_2_4.png',
    ],
  );

  static const thirdStep = OnBoardingData(
    label: 'Only important',
    description:
        'Keep only the most important data: passwords, notes, photos and more thanks to Locktap',
    screenshots: [
      'assets/images/onboarding/third_step/img_onboarding_3_1.png',
      'assets/images/onboarding/third_step/img_onboarding_3_2.png',
      'assets/images/onboarding/third_step/img_onboarding_3_3.png',
      'assets/images/onboarding/third_step/img_onboarding_3_4.png',
    ],
  );
}
