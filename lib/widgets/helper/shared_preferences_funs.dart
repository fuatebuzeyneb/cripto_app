import 'package:cripto_app/widgets/helper/cache_hekper.dart';
import 'package:cripto_app/widgets/helper/service_locator.dart';

void OnBoardingVisitedFun() {
  getIt<CacheHelper>().saveData(key: 'isOnBoardingVisited', value: true);
}

void modeDarkOrLightFun(bool value) {
  getIt<CacheHelper>().saveData(key: 'theme', value: value);
}
