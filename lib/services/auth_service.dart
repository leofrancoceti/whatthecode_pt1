import 'database_helper.dart';

class AuthService {
  static final DatabaseHelper _dbHelper = DatabaseHelper();

  static Future<bool> register(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email y contraseña son requeridos');
    }
    
    try {
      await _dbHelper.insertUser(email, password);
      return true;
    } catch (e) {
      throw Exception('El usuario ya existe');
    }
  }

  static Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email y contraseña son requeridos');
    }
    
    final isValid = await _dbHelper.validateUser(email, password);
    if (!isValid) {
      throw Exception('Credenciales inválidas');
    }
    return isValid;
  }
}