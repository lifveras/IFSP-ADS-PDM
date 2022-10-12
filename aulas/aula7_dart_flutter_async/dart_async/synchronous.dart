String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Seu pedido é: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine que ésta é uma função
    // lenta e complexa.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

void main() {
  print('Buscando pedido de usuário...');
  print(createOrderMessage());
}