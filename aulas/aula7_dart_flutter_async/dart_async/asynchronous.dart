Future<String> createOrderMessage() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder();
  } catch (err) {
    print('Caught error: $err');
  }
  var order = await fetchUserOrder();
  return 'Seu pedido é: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine que ésta é uma função
    // lenta e complexa.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

Future<void> main() async {
  print('Buscando pedido de usuário...');
  print(await createOrderMessage());
}
