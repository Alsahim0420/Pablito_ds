import 'package:flutter_test/flutter_test.dart';
import 'package:pablito_ds/pablito_ds.dart';

void main() {
  group('DesignTokens - Spacing', () {
    test('should have correct spacing values', () {
      expect(DesignTokens.spacingXS, 4.0);
      expect(DesignTokens.spacingSM, 8.0);
      expect(DesignTokens.spacingMD, 16.0);
      expect(DesignTokens.spacingLG, 24.0);
      expect(DesignTokens.spacingXL, 32.0);
      expect(DesignTokens.spacingXXL, 48.0);
    });

    test('spacing values should be positive', () {
      expect(DesignTokens.spacingXS, greaterThan(0));
      expect(DesignTokens.spacingSM, greaterThan(0));
      expect(DesignTokens.spacingMD, greaterThan(0));
      expect(DesignTokens.spacingLG, greaterThan(0));
      expect(DesignTokens.spacingXL, greaterThan(0));
      expect(DesignTokens.spacingXXL, greaterThan(0));
    });

    test('spacing values should be in ascending order', () {
      expect(DesignTokens.spacingSM, greaterThan(DesignTokens.spacingXS));
      expect(DesignTokens.spacingMD, greaterThan(DesignTokens.spacingSM));
      expect(DesignTokens.spacingLG, greaterThan(DesignTokens.spacingMD));
      expect(DesignTokens.spacingXL, greaterThan(DesignTokens.spacingLG));
      expect(DesignTokens.spacingXXL, greaterThan(DesignTokens.spacingXL));
    });
  });

  group('DesignTokens - Colors', () {
    test('should have defined primary colors', () {
      expect(DesignTokens.primary, isNotNull);
      expect(DesignTokens.primaryDark, isNotNull);
      expect(DesignTokens.primaryLight, isNotNull);
    });

    test('should have defined secondary colors', () {
      expect(DesignTokens.secondary, isNotNull);
      expect(DesignTokens.secondaryDark, isNotNull);
      expect(DesignTokens.secondaryLight, isNotNull);
    });

    test('should have defined state colors', () {
      expect(DesignTokens.success, isNotNull);
      expect(DesignTokens.warning, isNotNull);
      expect(DesignTokens.error, isNotNull);
      expect(DesignTokens.info, isNotNull);
    });

    test('should have defined neutral colors', () {
      expect(DesignTokens.background, isNotNull);
      expect(DesignTokens.surface, isNotNull);
      expect(DesignTokens.surfaceVariant, isNotNull);
      expect(DesignTokens.onBackground, isNotNull);
      expect(DesignTokens.onSurface, isNotNull);
    });

    test('should have defined dark theme colors', () {
      expect(DesignTokens.darkBackground, isNotNull);
      expect(DesignTokens.darkSurface, isNotNull);
      expect(DesignTokens.darkSurfaceVariant, isNotNull);
      expect(DesignTokens.darkOnBackground, isNotNull);
      expect(DesignTokens.darkOnSurface, isNotNull);
    });
  });

  group('DesignTokens - Typography', () {
    test('should have correct font sizes', () {
      expect(DesignTokens.fontSizeXS, 12.0);
      expect(DesignTokens.fontSizeSM, 14.0);
      expect(DesignTokens.fontSizeMD, 16.0);
      expect(DesignTokens.fontSizeLG, 18.0);
      expect(DesignTokens.fontSizeXL, 20.0);
      expect(DesignTokens.fontSizeXXL, 24.0);
      expect(DesignTokens.fontSizeXXXL, 32.0);
    });

    test('font sizes should be positive', () {
      expect(DesignTokens.fontSizeXS, greaterThan(0));
      expect(DesignTokens.fontSizeSM, greaterThan(0));
      expect(DesignTokens.fontSizeMD, greaterThan(0));
      expect(DesignTokens.fontSizeLG, greaterThan(0));
      expect(DesignTokens.fontSizeXL, greaterThan(0));
      expect(DesignTokens.fontSizeXXL, greaterThan(0));
      expect(DesignTokens.fontSizeXXXL, greaterThan(0));
    });

    test('should have defined font weights', () {
      expect(DesignTokens.fontWeightLight, isNotNull);
      expect(DesignTokens.fontWeightRegular, isNotNull);
      expect(DesignTokens.fontWeightMedium, isNotNull);
      expect(DesignTokens.fontWeightSemiBold, isNotNull);
      expect(DesignTokens.fontWeightBold, isNotNull);
    });

    test('should have correct font family', () {
      expect(DesignTokens.fontFamily, 'Roboto');
    });
  });

  group('DesignTokens - Border Radius', () {
    test('should have correct radius values', () {
      expect(DesignTokens.radiusSM, 4.0);
      expect(DesignTokens.radiusMD, 8.0);
      expect(DesignTokens.radiusLG, 12.0);
      expect(DesignTokens.radiusXL, 16.0);
      expect(DesignTokens.radiusFull, 9999.0);
    });

    test('radius values should be positive', () {
      expect(DesignTokens.radiusSM, greaterThanOrEqualTo(0));
      expect(DesignTokens.radiusMD, greaterThanOrEqualTo(0));
      expect(DesignTokens.radiusLG, greaterThanOrEqualTo(0));
      expect(DesignTokens.radiusXL, greaterThanOrEqualTo(0));
      expect(DesignTokens.radiusFull, greaterThan(0));
    });
  });

  group('DesignTokens - Elevation', () {
    test('should have correct elevation values', () {
      expect(DesignTokens.elevationSM, 2.0);
      expect(DesignTokens.elevationMD, 4.0);
      expect(DesignTokens.elevationLG, 8.0);
      expect(DesignTokens.elevationXL, 16.0);
    });

    test('elevation values should be non-negative', () {
      expect(DesignTokens.elevationSM, greaterThanOrEqualTo(0));
      expect(DesignTokens.elevationMD, greaterThanOrEqualTo(0));
      expect(DesignTokens.elevationLG, greaterThanOrEqualTo(0));
      expect(DesignTokens.elevationXL, greaterThanOrEqualTo(0));
    });
  });

  group('DesignTokens - Animations', () {
    test('should have defined animation durations', () {
      expect(DesignTokens.animationFast, isNotNull);
      expect(DesignTokens.animationNormal, isNotNull);
      expect(DesignTokens.animationSlow, isNotNull);
    });

    test('animation durations should be positive', () {
      expect(DesignTokens.animationFast.inMilliseconds, greaterThan(0));
      expect(DesignTokens.animationNormal.inMilliseconds, greaterThan(0));
      expect(DesignTokens.animationSlow.inMilliseconds, greaterThan(0));
    });

    test('animation durations should be in ascending order', () {
      expect(DesignTokens.animationNormal.inMilliseconds,
          greaterThan(DesignTokens.animationFast.inMilliseconds));
      expect(DesignTokens.animationSlow.inMilliseconds,
          greaterThan(DesignTokens.animationNormal.inMilliseconds));
    });
  });
}
