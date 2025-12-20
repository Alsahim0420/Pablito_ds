import 'package:flutter/material.dart';
import '../../theme/design_tokens.dart';
import '../../atoms/typography/heading.dart';
import '../../atoms/typography/body_text.dart';
import '../../atoms/divider/divider.dart';

/// Tabla de datos del sistema de diseño
class DataTableOrganism extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;
  final String? title;

  const DataTableOrganism({
    super.key,
    required this.columns,
    required this.rows,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: DesignTokens.elevationSM,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLG),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.all(DesignTokens.spacingLG),
              child: Heading(
                text: title!,
                level: HeadingLevel.h4,
              ),
            ),
            const DividerAtom(height: 0),
          ],
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: columns
                  .map((column) => DataColumn(
                        label: Heading(
                          text: column,
                          level: HeadingLevel.h6,
                        ),
                      ))
                  .toList(),
              rows: rows
                  .map((row) => DataRow(
                        cells: row
                            .map((cell) => DataCell(
                                  BodyText(
                                    text: cell,
                                    size: BodyTextSize.small,
                                  ),
                                ))
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

