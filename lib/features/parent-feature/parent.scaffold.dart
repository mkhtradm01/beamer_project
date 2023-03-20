import 'package:beamer/beamer.dart';
import 'package:beamer_project/features/parent-feature/scaffold.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router.beamer.dart';

final routerDelegates = [
  BeamerDelegate(
    initialPath: '/feature-one',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('/feature-one')) {
        return FeatureOneLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/feature-two',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('/feature-two')) {
        return FeatureTwoLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/feature-three',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('/feature-three')) {
        return FeatureThreeLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
  BeamerDelegate(
    initialPath: '/feature-four',
    locationBuilder: (routeInformation, _) {
      if (routeInformation.location!.contains('/feature-four')) {
        return FeatureFourLocation(routeInformation);
      }
      return NotFound(path: routeInformation.location!);
    },
  ),
];

class ParentScaffold extends HookConsumerWidget {
  const ParentScaffold({Key? key, required this.tabs, required this.routerDelegates}) : super(key: key);

  final List<ScaffoldWithNavBarTabItem> tabs;
  final List<BeamerDelegate> routerDelegates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = [
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/feature-one',
        icon: Icon(Icons.home),
        label: 'FeatureOne',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/feature-two',
        icon: Icon(Icons.search),
        label: 'FeatureTwo',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/feature-three',
        icon: Icon(Icons.favorite),
        label: 'FeatureThree',
      ),
      const ScaffoldWithNavBarTabItem(
        initialLocation: '/feature-four',
        icon: Icon(Icons.category_sharp),
        label: 'FeatureFour',
      ),
    ];
    final currentIndex = ref.watch(scaffoldCurrentIndexProvider);
    final tabController = useState(PlatformTabController(
      initialIndex: currentIndex,
    ));

    tabController.value.addListener(() {
      final tabIndex = tabController.value.index(context);

      if (tabIndex != currentIndex) {
        ref.read(scaffoldCurrentIndexProvider.notifier).state = tabIndex;
      }
      routerDelegates[tabIndex].update(rebuild: false);
    });

    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController.value,
      items: tabs,
      cupertinoTabs: (context, platform) => CupertinoTabBarData(
        backgroundColor: Colors.white,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
      ),
      materialTabs: (context, platform) => MaterialNavBarData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
      material: (_, __) => MaterialTabScaffoldData(
        bodyBuilder: (context, index) => IndexedStack(
          index: currentIndex,
          children: routerDelegates
              .map((delegate) => Beamer(
                    routerDelegate: delegate,
                  ))
              .toList(),
        ),
      ),
      cupertino: (_, __) => CupertinoTabScaffoldData(
        bodyBuilder: (context, index) => Beamer(
          routerDelegate: routerDelegates[index],
        ),
      ),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem({required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}
