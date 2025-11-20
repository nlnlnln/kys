import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://frvexfoezbscdbcvuxas.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZydmV4Zm9lemJzY2RiY3Z1eGFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk3NDY4ODgsImV4cCI6MjA3NTMyMjg4OH0.XDr9MFxBMX0P42a4MwjstxtZeh_Caqdyrfpfr7d9ec8',
  );
  
  runApp(MaterialApp(home: AuthScreen()));
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorText = '';

  Future<void> _signIn() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _errorText = 'Заполните все поля');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorText = '';
    });
    
    try {
      print('Пытаюсь войти: ${_emailController.text}');
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      print('Успешный вход: ${response.user?.email}');
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MapScreen()),
      );
    } catch (e) {
      print('Ошибка входа: $e');
      setState(() => _errorText = 'Ошибка входа: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signUp() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _errorText = 'Заполните все поля');
      return;
    }

    if (_passwordController.text.length < 6) {
      setState(() => _errorText = 'Пароль должен быть не менее 6 символов');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorText = '';
    });
    
    try {
      print('Пытаюсь зарегистрировать: ${_emailController.text}');
      final response = await Supabase.instance.client.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      print('Успешная регистрация: ${response.user?.email}');
      
      if (response.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()),
        );
      } else {
        setState(() => _errorText = 'Регистрация завершена. Подтвердите email.');
      }
    } catch (e) {
      print('Ошибка регистрации: $e');
      setState(() => _errorText = 'Ошибка регистрации: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'минимум 6 символов',
                      labelText: 'Пароль',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  
                  if (_errorText.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        _errorText,
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _signIn,
                            child: Text('Войти'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _signUp,
                            child: Text('Регистрация'),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Карта'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(55.7558, 37.6173),
          initialZoom: 10,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: LatLng(55.7558, 37.6173),
                color: Colors.blue.withOpacity(0.5),
                borderColor: Colors.blue,
                borderStrokeWidth: 2,
                radius: 5000,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Карта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}