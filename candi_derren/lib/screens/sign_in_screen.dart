import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignIn = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO: 5. TextFormField nama pengguna
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Pengguna',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                // TODO: 6. TextFormField kata sandi
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    errorText: _errorText.isNotEmpty ? _errorText : null,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                ),
                const SizedBox(height: 20),

                // TODO: 7. ElevatedButton Sign In
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Contoh logika sign in sederhana
                      setState(() {
                        if (_usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          _errorText = 'Nama pengguna dan kata sandi harus diisi';
                        } else {
                          _errorText = '';
                          // Lakukan aksi sign in di sini
                        }
                      });
                    },
                    child: const Text('Sign In'),
                  ),
                ),
                const SizedBox(height: 10),

                // TODO: 8. TextButton Sign Up
                TextButton(
                  onPressed: () {
                    // Aksi navigasi ke halaman Sign Up
                  },
                  child: const Text('Belum punya akun? Daftar di sini.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}