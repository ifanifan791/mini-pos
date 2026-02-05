class LoginDummy {
  static const Map<String, String> ownerAccount = {
    'username': 'owner123',
    'password': 'passwordowner',
    'role': 'Owner'
  };

  static const Map<String, String> staffAccount = {
    'username': 'slamet',
    'password': 'passwordkasir',
    'role': 'Staff'
  };

  static String? validate(String user, String pass) {
    if (user == ownerAccount['username'] && pass == ownerAccount['password']) {
      return ownerAccount['role'];
    } else if (user == staffAccount['username'] && pass == staffAccount['password']) {
      return staffAccount['role'];
    }
    return null; 
  }
}