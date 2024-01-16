import 'package:bloc/bloc.dart';
import 'package:cripto_app/widgets/helper/service_locator.dart';
import 'package:cripto_app/widgets/helper/shared_preferences_funs.dart';
import 'package:flutter/material.dart';

import '../../widgets/helper/cache_hekper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  bool _isDark = getIt<CacheHelper>().getData(key: 'theme') ?? true;
  bool get isDark => _isDark;

  changeTheme() {
    if (_isDark == false) {
      _isDark = true;
      modeDarkOrLightFun(true);
    } else if (_isDark == true) {
      _isDark = false;
      modeDarkOrLightFun(false);
    }
    emit(ThemeChanged());
  }
}
