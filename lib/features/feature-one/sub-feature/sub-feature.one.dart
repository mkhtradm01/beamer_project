import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../router.beamer.dart';

class SubFeatureOne extends StatelessWidget {
  const SubFeatureOne({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: true,
        trailingActions: [
          PlatformIconButton(
            icon: Icon(context.platformIcons.search),
            onPressed: () {
              Beamer.of(globalScaffoldKey.currentContext!).beamToNamed('/outside-feature');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('SubFeatureOne'),
      ),
    );
  }
}
