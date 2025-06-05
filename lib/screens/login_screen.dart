import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; 
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  String? _errorText;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _login() {
    if (_userController.text == "admin" && _passController.text == "1234") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()), 
      );
    } else {
      setState(() {
        _errorText = "Usuario o contraseña incorrectos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/portada.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Placeholder(), 
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          const AssetImage('assets/images/whathecode_logo.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "WHAT THE CODE",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),       
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _userController,
                          decoration: const InputDecoration(
                              labelText: 'Usuario', // 
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _passController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40)),
                          child: const Text("Ingresar"),
                        ),
                            TextButton(onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (_) => const RegisterScreen()), ),
                             child: const Text('¿No tienes cuenta? Regístrate'),
                            ),
                        if (_errorText != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              _errorText!,
                              style: const TextStyle(color: Colors.red), 
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}