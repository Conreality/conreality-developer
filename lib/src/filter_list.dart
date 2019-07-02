/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

class FilterInfo {
  final IconData icon;
  final String label;
  final String summary;
  final bool isActive;

  const FilterInfo(this.icon, this.label, this.summary, this.isActive);
}

////////////////////////////////////////////////////////////////////////////////

final List<FilterInfo> _filters = [
  FilterInfo(null, "Edge detection", "Not available at present.", false), // TODO: icon
  FilterInfo(Icons.face, "Face detection", "Not available at present.", false),
  FilterInfo(Icons.face, "Face recognition", "Not available at present.", false),
  FilterInfo(null, "Object recognition", "Not available at present.", false),
  FilterInfo(null, "Object tracking", "Not available at present.", false),
];

////////////////////////////////////////////////////////////////////////////////

class FilterList extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: _filters.length,
      itemBuilder: (final BuildContext context, final int index) {
        final FilterInfo filter = _filters[index];
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
