/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'filters.dart' show filters;
import 'main_drawer.dart' show MainDrawer;

////////////////////////////////////////////////////////////////////////////////

class FiltersScreen extends StatefulWidget {
  static const route = "/filters";

  FiltersScreen({Key key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersState();
}

////////////////////////////////////////////////////////////////////////////////

class _FiltersState extends State<FiltersScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: null,
          ),
        ].where((element) => element != null).toList(),
      ),
      drawer: MainDrawer(),
      body: Center(child: FilterList()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////

class FilterList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: filters.length,
      itemBuilder: (final BuildContext context, final int index) {
        final filter = filters[index];
        return GestureDetector(
          child: ListTile(
            leading: Icon(filter.icon ?? Icons.filter_none),
            title: Text(filter.label),
            subtitle: Text(filter.summary),
            trailing: Icon(filter.isActive ? Icons.check_box : Icons.check_box_outline_blank, color: Theme.of(context).disabledColor),
          ),
          onTap: () {
            // TODO
          },
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }
}
