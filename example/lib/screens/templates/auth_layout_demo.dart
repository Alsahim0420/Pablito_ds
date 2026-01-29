import 'package:flutter/material.dart';
import 'package:pablito_ds/pablito_ds.dart';

class PabAuthLayoutDemo extends StatefulWidget {
  const PabAuthLayoutDemo({super.key});

  @override
  State<PabAuthLayoutDemo> createState() => _PabAuthLayoutDemoState();
}

class _PabAuthLayoutDemoState extends State<PabAuthLayoutDemo> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

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
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login exitoso'),
              backgroundColor: DesignTokens.success,
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PabAuthLayout(
      title: 'Iniciar Sesión',
      subtitle: 'Ingresa tus credenciales',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PabTextInput(
              label: 'Email',
              hint: 'tu@email.com',
              controller: _emailController,
              prefixIcon: Icons.email,
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
            const SizedBox(height: DesignTokens.spacingMD),
            PabTextInput(
              label: 'Contraseña',
              hint: '••••••••',
              controller: _passwordController,
              prefixIcon: Icons.lock,
              obscureText: _obscurePassword,
              suffixIcon: _obscurePassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              onSuffixIconTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
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
            const SizedBox(height: DesignTokens.spacingMD),
            Align(
              alignment: Alignment.centerRight,
              child: PabTextButton(
                label: '¿Olvidaste tu contraseña?',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            PabPrimaryButton(
              label: 'Iniciar Sesión',
              onPressed: _handleLogin,
              isLoading: _isLoading,
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingMD),
            PabSecondaryButton(
              label: 'Crear Cuenta',
              onPressed: () {},
              isFullWidth: true,
            ),
            const SizedBox(height: DesignTokens.spacingLG),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PabBodyText(
                  text: '¿No tienes cuenta? ',
                  size: BodyTextSize.small,
                ),
                PabTextButton(label: 'Regístrate', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
