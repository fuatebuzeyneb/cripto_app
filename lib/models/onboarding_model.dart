import 'package:cripto_app/widgets/utils/app_assets.dart';
import 'package:cripto_app/widgets/utils/app_strings.dart';

class OnBoardingModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingModel(this.title, this.subTitle, this.image);
}

List<OnBoardingModel> onboardingContact = [
  OnBoardingModel(
    AppStrings.onBoardingTitleOne,
    AppStrings.onBoardingContentOne,
    AppAssets.kOnboardingImageOne,
  ),
  OnBoardingModel(
    AppStrings.onBoardingTitleTow,
    AppStrings.onBoardingContentTow,
    AppAssets.kOnboardingImageTow,
  ),
  OnBoardingModel(
    AppStrings.onBoardingTitleThere,
    AppStrings.onBoardingContentThere,
    AppAssets.kOnboardingImageThere,
  ),
];
