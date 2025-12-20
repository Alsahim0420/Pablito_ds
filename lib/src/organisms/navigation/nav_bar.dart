import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/icon/icon_atom.dart';
import '../../atoms/typography/body_text.dart';

/// Barra de navegación del sistema de diseño
class NavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<NavBarItem> items;

  const NavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DesignTokens.background,
        border: Border(
          top: BorderSide(
            color: DesignTokens.border,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = index == currentIndex;

            return Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: DesignTokens.spacingSM,
                      horizontal: DesignTokens.spacingXS,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconAtom(
                          icon: item.icon,
                          color: isSelected
                              ? DesignTokens.primary
                              : DesignTokens.onSurface.withOpacity(0.6),
                          predefinedSize: IconSize.medium,
                        ),
                        const SizedBox(height: DesignTokens.spacingXS),
                        BodyText(
                          text: item.label,
                          size: BodyTextSize.small,
                          color: isSelected
                              ? DesignTokens.primary
                              : DesignTokens.onSurface.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class NavBarItem {
  final IconData icon;
  final String label;

  NavBarItem({
    required this.icon,
    required this.label,
  });
}

