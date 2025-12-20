import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';

/// Avatar del sistema de diseño
class Avatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;

  const Avatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? DesignTokens.primary,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null && initials != null
          ? Center(
              child: Text(
                initials!.toUpperCase(),
                style: TextStyle(
                  color: textColor ?? DesignTokens.onPrimary,
                  fontSize: size * 0.4,
                  fontWeight: DesignTokens.fontWeightSemiBold,
                ),
              ),
            )
          : null,
    );
  }
}

