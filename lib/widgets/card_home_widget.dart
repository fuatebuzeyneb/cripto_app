import 'package:cripto_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:cripto_app/models/home_model.dart';

import 'package:cripto_app/widgets/text_card_home_widget.dart';
import 'package:cripto_app/widgets/text_widget.dart';
import 'package:cripto_app/widgets/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardHomeWidget extends StatelessWidget {
  const CardHomeWidget({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: themeCubit.isDark
              ? AppColors.kPrimaryColorDark
              : AppColors.kWhiteColor,
        ),
        height: size.width * 0.5,
        width: size.width * 0.95,
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: TextWidget(
                      text: homeModel.date,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    color: themeCubit.isDark
                        ? AppColors.kPrimaryColorDark
                        : AppColors.kWhiteColor,
                  ),
                  height: size.width * 0.5,
                  width: size.width * 0.71,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: size.width * 0.12,
                              ),
                              TextCardHomeWidget(
                                icon: FontAwesomeIcons.moneyBillTransfer,
                                text:
                                    '${homeModel.currencySymbolFrom}/${homeModel.currencySymbolTo}',
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              TextCardHomeWidget(
                                icon: FontAwesomeIcons.handHoldingDollar,
                                text: 'Buy limit : ${homeModel.buyLimit}',
                                color: themeCubit.isDark
                                    ? AppColors.kWhiteColor
                                    : AppColors.kBlackColor,
                              ),
                              TextCardHomeWidget(
                                icon: FontAwesomeIcons.hand,
                                text: 'Stop loss : ${homeModel.stopLoss}',
                                color: Colors.red,
                              ),
                              TextCardHomeWidget(
                                icon: FontAwesomeIcons.crosshairs,
                                text:
                                    'Take profit (1) : ${homeModel.profitOne}',
                                color: Colors.green,
                              ),
                              TextCardHomeWidget(
                                icon: FontAwesomeIcons.crosshairs,
                                text:
                                    'Take profit (2) : ${homeModel.profitTwo}',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: homeModel.operation == 'Sell'
                      ? Colors.red
                      : const Color(0xFF4F6F52),
                  height: size.width * 0.5,
                  width: size.width * 0.15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homeModel.operation,
                        style: TextStyle(
                            fontSize: 20,
                            color: themeCubit.isDark
                                ? AppColors.kWhiteColor
                                : AppColors.kBlackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'R: ${homeModel.R}',
                        style: TextStyle(
                          fontSize: 16,
                          color: themeCubit.isDark
                              ? AppColors.kWhiteColor
                              : AppColors.kBlackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//820000
