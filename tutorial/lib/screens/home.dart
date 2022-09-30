import 'package:flutter/material.dart';
import 'package:tutorial/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tutorial/screens/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // Requerimos que introduzca el titulo

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text('${widget.title} $currentPage'),
        elevation: 5,
      ),

      // Cambios de pantalla
      // body: currentPage == 0 ? const SettingsScreen(colorFondo: Colors.green) : const SettingsScreen(colorFondo: Colors.blue),
      body: PageView(
        controller: pageController,
        // physics: const BouncingScrollPhysics(), // Podemos desplazarnos mediante movimiento tactil lateral
        physics: const NeverScrollableScrollPhysics(), // No deja desplazar mediante movimiento lateral
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //Pantalla 1
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Prueba enlace'),
                  onPressed: (){
                    launchUrl(Uri.parse('https://pub.dev/packages/url_launcher/example'));
                    // launchUrl(Uri.parse('http://192.168.2.59:8080'));
                }),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          //Pantalla 2
          const SettingsScreen(colorFondo: Colors.green),

          //Pantalla 3
          const LoginScreen(),
        ],
      ),

      //Botton navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) => { //Cuando cambiamos seteamos currentPage
          currentPage = index,
          pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeOut ),
          setState((){}), //Cuando hay cambio de estado, resetear estado para comprobarlo
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.blue.withOpacity(0.5),
          // ignore: prefer_const_literals_to_create_immutables
          items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.verified_user_outlined),
                label: 'User'
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.login_sharp),
                label: 'Login'
              ),
            ],
        ),
    );
  }
}
