import 'package:cripto_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextCardHomeWidget extends StatelessWidget {
  const TextCardHomeWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    this.fontSize = 14,
  });

  final String text;
  final IconData icon;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    // ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 8,
          ),
          TextWidget(
            text: text,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
