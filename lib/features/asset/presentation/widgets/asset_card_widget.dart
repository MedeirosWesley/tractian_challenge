import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/widgets/icons/asset_icon.dart';
import 'package:tractian_challenge/features/asset/data/models/asset_model.dart';

class AssetCardWidget extends StatefulWidget {
  final AssetModel asset;
  final List<Widget>? children;
  final bool isExpanded;
  const AssetCardWidget(
      {super.key,
      required this.asset,
      required this.children,
      required this.isExpanded});

  @override
  State<AssetCardWidget> createState() => _AssetCardWidgetState();
}

class _AssetCardWidgetState extends State<AssetCardWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      children: [
        if (widget.children == null)
          Positioned(
              top: 30,
              left: 8,
              child: Container(height: 1.0, width: 15, color: Colors.grey)),
        ExpansionTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            initiallyExpanded: widget.isExpanded,
            enabled: widget.children != null,
            textColor: textTheme.bodySmall?.color,
            showTrailingIcon: false,
            onExpansionChanged: (value) => setState(() => isExpanded = value),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.children != null)
                  AnimatedRotation(
                      duration: const Duration(milliseconds: 200),
                      turns: (isExpanded ? 0 : 180) / 360,
                      child: const Icon(
                        Icons.expand_more,
                        size: 20,
                      )),
                const SizedBox(width: 10),
                const AssetIcon(height: 22, width: 22),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    widget.asset.name,
                    style: textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            children: widget.children ?? []),
      ],
    );
  }
}
