import 'package:flutter/material.dart';
import 'package:forms_flutter/model/login_class.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  // invocado quando o form for removido da árvore de widgets
  // isso permite liberar qualquer recurso que o widget esteja usando
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Identificador do Formulário na árvore de Widgets
  // Usaremos para realizar validação dos inputs
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                hintText: "Email",
              ),
              // Passamos um callback para validar a string inserida no campo
              validator: _validateEmail,
              maxLength: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: "Email",
              ),
              obscureText: true,
              // Passamos um callback para validar a string inserida no campo
              validator: _validatePassword,
              maxLength: 20,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            )
          ],
        ));
  }

  String? _validateEmail(String? value) {
    if (value?.isEmpty ?? false) {
      return "O campo não pode ser vazio";
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (value != null && value.length < 8) {
      return "Digite pelo menos 8 caracteres!";
    } else {
      return null;
    }
  }

  void _login() {
    // A _key será útil aqui para invocarmos a validação dos formulário.
    if (_key.currentState?.validate() ?? false) {
      final email = emailController.text;
      final password = passwordController.text;

      final login = LoginClass(
        user: email,
        password: password,
      );
    } else {
      // Mostra um erro ou algum alerta!
    }
  }
}
