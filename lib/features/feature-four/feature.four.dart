import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router.beamer.dart';

class FeatureFour extends HookConsumerWidget {
  const FeatureFour({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
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
        child: Text('FeatureFour'),
      ),
    );
  }
}
