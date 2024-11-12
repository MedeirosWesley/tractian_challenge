import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/widgets/icons/location_icon.dart';
import 'package:tractian_challenge/features/asset/data/models/location_model.dart';

class LocationCardWidget extends StatefulWidget {
  final LocationModel location;
  final List<Widget>? children;
  final bool isExpanded;
  const LocationCardWidget(
      {super.key,
      required this.location,
      required this.children,
      required this.isExpanded});

  @override
  State<LocationCardWidget> createState() => _LocationCardWidgetState();
}

class _LocationCardWidgetState extends State<LocationCardWidget> {
  bool isExpanded = false;
  ExpansionTileController expansionTileController = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ExpansionTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        showTrailingIcon: false,
        enabled: widget.children != null,
        textColor: textTheme.bodySmall?.color,
        initiallyExpanded: widget.isExpanded,
        onExpansionChanged: (value) => setState(() => isExpanded = value),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.children != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: AnimatedRotation(
                    duration: const Duration(milliseconds: 200),
                    turns: (isExpanded ? 0 : 180) / 360,
                    child: const Icon(
                      Icons.expand_more,
                      size: 20,
                    )),
              ),
            const LocationIcon(height: 22, width: 22),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.location.name,
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
        children: widget.children ?? []);
  }
}
