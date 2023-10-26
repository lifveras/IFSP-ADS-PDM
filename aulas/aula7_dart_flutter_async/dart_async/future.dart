Future<void> fetchUserOrder() {
  // Imagine que esta função está buscando dados 
  // de usuário de outro serviço ou banco de dados
  return Future.delayed(
    const Duration(seconds: 2), 
    () => throw Exception('Logout failed: user ID is invalid'));
}

void main() {
  fetchUserOrder();
  print('Buscando pedido de usuário...');
}