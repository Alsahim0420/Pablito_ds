import 'package:flutter/material.dart';
import '../templates/auth_layout.dart';
import '../molecules/form/form_field_group.dart';
import '../atoms/input/text_input.dart';
import '../atoms/button/primary_button.dart';
import '../atoms/button/secondary_button.dart';
import '../atoms/typography/body_text.dart';
import '../theme/design_tokens.dart';

/// Página de login de ejemplo del sistema de diseño Pablito DS
class PabLoginPage extends StatefulWidget {
  const PabLoginPage({super.key});

  @override
  State<PabLoginPage> createState() => _PabLoginPageState();
}

class _PabLoginPageState extends State<PabLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      // Simular login
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PabAuthLayout(
      title: 'Bienvenido',
      subtitle: 'Inicia sesión para continuar',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PabFormFieldGroup(
              label: 'Correo electrónico',
              fields: [
                PabTextInput(
                  controller: _emailController,
                  hint: 'tu@email.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    }
                    if (!value.contains('@')) {
                      return 'Correo inválido';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            PabFormFieldGroup(
              label: 'Contraseña',
              fields: [
                PabTextInput(
                  controller: _passwordController,
                  hint: '••••••••',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    }
                    if (value.length < 6) {
                      return 'La contraseña debe tener al menos 6 caracteres';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            Align(
              alignment: Alignment.centerRight,
              child: PabBodyText(
                text: '¿Olvidaste tu contraseña?',
                size: BodyTextSize.small,
                color: DesignTokens.primary,
              ),
            ),
            const SizedBox(height: DesignTokens.spacingXXL),
            PabPrimaryButton(
              label: 'Iniciar sesión',
              onPressed: _handleLogin,
              isLoading: _isLoading,
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            PabSecondaryButton(
              label: 'Crear cuenta',
              onPressed: () {},
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
