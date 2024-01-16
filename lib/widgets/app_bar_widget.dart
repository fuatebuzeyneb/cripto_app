import 'package:cripto_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.icon,
    required this.title,
    this.bottom,
  });
  final Icon? icon;
  final String title;
  final TabBar? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      centerTitle: true,
      leading: icon,
      title: TextWidget(
        text: title,
        fontSize: 20,
      ),
    );
  }
}
