import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class FeatureOne extends StatelessWidget {
  const FeatureOne({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: PlatformIconButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/feature-one/sub-feature-one');
            },
            icon: const Text('FeatureOne')),
      ),
    );
  }
}
