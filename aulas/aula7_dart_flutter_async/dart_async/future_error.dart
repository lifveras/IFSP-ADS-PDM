Future<void> fetchUserOrder() {
  // Imagine que esta função está buscando dados 
  // de usuário de outro serviço ou banco de dados
  return Future.delayed(
    const Duration(seconds: 2), 
    () => print('Large Latte'),);
}

void main() {
  fetchUserOrder();
  print('Buscando pedido de usuário...');
}