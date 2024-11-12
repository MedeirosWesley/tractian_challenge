import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/widgets/icons/component_icon.dart';
import 'package:tractian_challenge/features/asset/data/enums/component_status.dart';
import 'package:tractian_challenge/features/asset/data/enums/sensor_type.dart';
import 'package:tractian_challenge/features/asset/data/models/component_model.dart';

class ComponentCardWidget extends StatelessWidget {
  final ComponentModel component;
  const ComponentCardWidget({super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      height: 50,
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ComponentIcon(height: 22, width: 22),
            const SizedBox(width: 10),
            Text(
              component.name,
              style: textTheme.bodySmall,
            ),
            if (component.sensorType == SensorType.energy)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.bolt, size: 20, color: Colors.green),
              ),
            if (component.status == ComponentStatus.alert)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.circle, size: 15, color: Colors.red),
              )
          ],
        ),
      ),
    );
  }
}
