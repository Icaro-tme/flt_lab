import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSidebarExpanded = false;

  void _toggleSidebar() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HeaderComp(
          isSidebarExpanded: _isSidebarExpanded,
          toggleSidebar: _toggleSidebar,
        ),
      ),
      drawer: _isSidebarExpanded ? Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('Sidebar')),
            ListTile(title: Text('Item 1')),
            ListTile(title: Text('Item 2')),
          ],
        ),
      ) : null,
      body: Center(child: Text('Main Content')),
    );
  }
}

class HeaderComp extends StatelessWidget {
  final bool isSidebarExpanded;
  final VoidCallback toggleSidebar;

  HeaderComp({
    required this.isSidebarExpanded,
    required this.toggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: toggleSidebar,
          ),
          GestureDetector(
            onTap: () {
              // Handle logo tap
              Navigator.pushNamed(context, '/');
            },
            child: Image.asset(
              'assets/iemaLogo.png',
              height: 40,
            ),
          ),
          Spacer(),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.language),
                tooltip: 'Linguagem de sinais',
                onPressed: () {
                  // Handle language button press
                },
              ),
              IconButton(
                icon: Icon(Icons.keyboard),
                tooltip: 'Teclado virtual',
                onPressed: () {
                  // Handle virtual keyboard button press
                },
              ),
              IconButton(
                icon: Icon(Icons.accessibility),
                tooltip: 'Acessibilidade',
                onPressed: () {
                  // Handle accessibility button press
                },
              ),
              IconButton(
                icon: Icon(Icons.contrast),
                tooltip: 'Modo alto contraste',
                onPressed: () {
                  // Handle high contrast mode toggle
                },
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.manage_accounts),
            tooltip: 'Login',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => LoginDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoginDialog extends StatefulWidget {
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _confPasswordController = TextEditingController();
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isLogin ? 'Entrar' : 'Cadastre-se'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_isLogin) ...[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email/Usuário'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Text("Primeira vez no sistema?"),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = false;
                });
              },
              child: Text("Crie uma conta"),
            ),
          ] else ...[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Nome de Usuário'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            TextField(
              controller: _confPasswordController,
              decoration: InputDecoration(labelText: 'Confirme a senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: Text("Aceito os termos e condições"),
            ),
            SizedBox(height: 20),
            Text("Já tem uma conta?"),
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = true;
                });
              },
              child: Text("Entrar"),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Fechar"),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle submit
          },
          child: Text(_isLogin ? 'Entrar' : 'Cadastrar'),
        ),
      ],
    );
  }
}
