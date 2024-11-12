import 'package:flutter/material.dart';

class FilterButtom extends StatefulWidget {
  final String label;
  final IconData icon;
  final void Function(bool) onSelected;
  const FilterButtom(
      {super.key,
      required this.label,
      required this.icon,
      required this.onSelected});

  @override
  State<FilterButtom> createState() => _FilterButtomState();
}

class _FilterButtomState extends State<FilterButtom> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ChoiceChip(
      selected: isSelected,
      onSelected: (value) {
        setState(() {
          isSelected = value;
        });
        widget.onSelected(value);
      },
      color: WidgetStateProperty.all<Color>(
          isSelected ? colorScheme.secondary : colorScheme.surface),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: isSelected ? colorScheme.secondary : Colors.grey,
        ),
      ),
      showCheckmark: false,
      avatar: Icon(
        widget.icon,
        color: isSelected ? colorScheme.onSecondary : Colors.grey,
      ),
      label: Text(
        widget.label,
        style: textTheme.bodySmall?.copyWith(
          color: isSelected ? colorScheme.onSecondary : colorScheme.onSurface,
        ),
      ),
    );
  }
}
