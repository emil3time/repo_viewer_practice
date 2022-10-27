import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmptyRepoPage extends StatelessWidget {
  final String message;

  const EmptyRepoPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            MdiIcons.emoticonPoop,
            size: 96,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
