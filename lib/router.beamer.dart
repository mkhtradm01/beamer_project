import 'package:beamer/beamer.dart';
import 'package:beamer_project/features/outside-feature/outside.feature.dart';
import 'package:flutter/material.dart';

import 'features/feature-four/feature.four.dart';
import 'features/feature-one/feature.one.dart';
import 'features/feature-one/sub-feature/sub-feature.one.dart';
import 'features/feature-three/feature.three.dart';
import 'features/feature-two/feature.two.dart';
import 'features/parent-feature/parent.scaffold.dart';

final globalScaffoldKey = GlobalKey<NavigatorState>();

final routerDelegate = BeamerDelegate(
  initialPath: '/feature-one',
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '*': (context, state, data) {
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

        return ParentScaffold(tabs: tabs, routerDelegates: routerDelegates);
      },
      '/outside-feature': (context, state, data) {
        return const BeamPage(
          key: ValueKey('outside-feature'),
          title: 'OutsideFeature',
          // type: BeamPageType.slideTransition,
          child: OutsideFeature(),
        );
      },
    },
  ),
);

class FeatureOneLocation extends BeamLocation<BeamState> {
  FeatureOneLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/feature-one/:name'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('feature-one'),
          title: 'FeatureOne',
          type: BeamPageType.noTransition,
          child: FeatureOne(),
        ),
        if (state.pathParameters.containsKey('name'))
          const BeamPage(
            key: ValueKey('sub-feature-one'),
            title: 'SubFeatureOne',
            type: BeamPageType.noTransition,
            child: SubFeatureOne(),
          ),
      ];
}

class FeatureTwoLocation extends BeamLocation<BeamState> {
  FeatureTwoLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('feature-two'),
          title: 'FeatureTwo',
          type: BeamPageType.noTransition,
          child: FeatureTwo(),
        ),
      ];
}

class FeatureThreeLocation extends BeamLocation<BeamState> {
  FeatureThreeLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('feature-three'),
          title: 'FeatureThree',
          type: BeamPageType.noTransition,
          child: FeatureThree(),
        ),
      ];
}

class FeatureFourLocation extends BeamLocation<BeamState> {
  FeatureFourLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('feature-four'),
          title: 'FeatureFour',
          type: BeamPageType.noTransition,
          child: FeatureFour(),
        ),
      ];
}

class OutsideFeatureLocation extends BeamLocation<BeamState> {
  OutsideFeatureLocation(super.routeInformation);
  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('outside-feature'),
          title: 'OutsideFeature',
          type: BeamPageType.slideTopTransition,
          child: OutsideFeature(),
        ),
      ];
}
