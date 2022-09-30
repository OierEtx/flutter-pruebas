import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.green,
              ],
            )),
            child: Image.asset(
              "assets/images/prueba.png",
              height: 300,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -40), // Colocación del card inferior
            child: Center(
              child: SingleChildScrollView(
                // Para poder mover todo el card
                child: Card(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          controller: usuarioController,
                          decoration:
                              const InputDecoration(labelText: "Usuario"),
                        ),
                        TextFormField(
                          controller: passwordController,
                          decoration:
                              const InputDecoration(labelText: "Contraseña"),
                          obscureText: true, // Letras ocultas tipo contraseña
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top:
                                  20), // Espacio entre boton iniciar sesion y campo contraseña
                          child: ElevatedButton(
                            onPressed: () {
                              _login(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Iniciar Sesión'),
                                _loading
                                    ? Container(
                                        // IF ternario
                                        height: 20,
                                        width: 20,
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const CircularProgressIndicator(
                                            color: Colors.white),
                                      )
                                    : const Text('')
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          // Espacio inferior
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text('No estas registrado?    '),
                            GestureDetector(
                              child: const Text('Registrarse',
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () {
                                try {
                                  launchUrlString(
                                      'https://www.kindacode.com/article/flutter-make-text-clickable-like-hyperlinks-on-the-web/');
                                } catch (err) {
                                  debugPrint('No se pudo acceder al enlace');
                                }
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future _login(BuildContext context) {
    if (!_loading) {
      setState(() {
        _loading = true;
      });
    }
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Alert Message"),
          // Retrieve the text which the user has entered by
          // using the TextEditingController.
          content: Text(usuarioController.text),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _loading = false;
                });
              },
            )
          ],
        );
      }
    );
  }
}
