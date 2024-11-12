import 'package:flutter/material.dart';
import 'package:tractian_challenge/core/widgets/icons/company_icon.dart';

class CompanyWidget extends StatelessWidget {
  final void Function() onTap;
  final String companyName;
  const CompanyWidget(
      {super.key, required this.companyName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: 76,
        decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            const CompanyIcon(height: 24, width: 24),
            const SizedBox(width: 16),
            Text('$companyName Unit',
                style: textTheme.titleLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
