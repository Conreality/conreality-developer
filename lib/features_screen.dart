/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';
import 'package:conreality_icons/conreality_icons.dart' show ConrealityIcons;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' show MdiIcons;

import 'main_drawer.dart' show MainDrawer;
import 'features.dart' show features;

////////////////////////////////////////////////////////////////////////////////

class FeaturesScreen extends StatefulWidget {
  static const route = "/features";

  FeaturesScreen({Key key}) : super(key: key);

  @override
  State<FeaturesScreen> createState() => _FeaturesState();
}

////////////////////////////////////////////////////////////////////////////////

class _FeaturesState extends State<FeaturesScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Features"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: FeatureList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class FeatureList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: features.length,
      itemBuilder: (final BuildContext context, final int index) {
        final feature = features[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(feature.icon ?? MdiIcons.apps),
            title: Text(feature.label),
            subtitle: Text(feature.summary),
          ),
          onTap: () {
            if (feature.route != null) {
              Navigator.of(context).pushNamed(feature.route);
            }
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
