import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DesignTokens', () {
    test('should have defined spacing values', () {
      expect(DesignTokens.spacingXS, 4.0);
      expect(DesignTokens.spacingSM, 8.0);
      expect(DesignTokens.spacingMD, 16.0);
      expect(DesignTokens.spacingLG, 24.0);
      expect(DesignTokens.spacingXL, 32.0);
    });

    test('should have defined color values', () {
      expect(DesignTokens.primary, isNotNull);
      expect(DesignTokens.secondary, isNotNull);
      expect(DesignTokens.error, isNotNull);
      expect(DesignTokens.success, isNotNull);
    });

    test('should have defined font sizes', () {
      expect(DesignTokens.fontSizeXS, 12.0);
      expect(DesignTokens.fontSizeSM, 14.0);
      expect(DesignTokens.fontSizeMD, 16.0);
      expect(DesignTokens.fontSizeLG, 18.0);
    });
  });

  group('DesignTheme', () {
    test('should create light theme', () {
      final theme = DesignTheme.lightTheme;
      expect(theme, isNotNull);
      expect(theme.useMaterial3, true);
    });
  });

  group('BadgeAtom', () {
    test('should create badge with label', () {
      const badge = BadgeAtom(label: 'Test', variant: BadgeVariant.primary);
      expect(badge.label, 'Test');
      expect(badge.variant, BadgeVariant.primary);
    });
  });
}
