import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OutsideFeature extends StatelessWidget {
  const OutsideFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        automaticallyImplyLeading: false,
        leading: PlatformIconButton(
          icon: Icon(context.platformIcons.back),
          onPressed: () {
            Beamer.of(context).beamBack();
          },
        ),
      ),
      body: const Center(
        child: Text('OutsideFeature'),
      ),
    );
  }
}
