import 'package:flutter/material.dart';
import '../../atoms/input/text_input.dart';

/// Barra de búsqueda del sistema de diseño Pablito DS
class PabSearchBar extends StatelessWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;

  const PabSearchBar({
    super.key,
    this.hint,
    this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PabTextInput(
      hint: hint ?? 'Buscar...',
      controller: controller,
      onChanged: onChanged,
      prefixIcon: Icons.search,
      suffixIcon: controller?.text.isNotEmpty == true ? Icons.clear : null,
      onSuffixIconTap: onClear,
    );
  }
}
