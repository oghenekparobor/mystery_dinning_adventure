

import 'package:flutter/material.dart';
import 'package:mystery_dinning_adventure/core/__extension_export.dart';
import 'package:mystery_dinning_adventure/core/extension/widget.dart';

class TitleContent extends StatelessWidget {
  const TitleContent({
    super.key,
    required this.content,
    required this.title,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: context.textTheme.labelMedium,
        ),
        Text(
          content,
          style: context.textTheme.headlineMedium,
        ),
      ],
    ).padHorizontal;
  }
}
