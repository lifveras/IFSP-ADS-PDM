import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  runApp(const MaterialApp(
    home: NotificationGenerator(),
  ));
}

class NotificationGenerator extends StatefulWidget {
  const NotificationGenerator({super.key});

  @override
  State<NotificationGenerator> createState() => _NotificationGeneratorState();
}

class _NotificationGeneratorState extends State<NotificationGenerator> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NotificationDetails platformChannelSpecifics;
  // Variável para receber a mensagem de erro em caso de falha no uso da
  // notificação.
  var notificationsChannelInitializationError = '';
  // Variável para receber o Future retornado pela
  // função initializeNotificationsChannel
  late Future<bool> futureInitializeNotificationsChannel;

  Future<bool> initializeNotificationsChannel() async {
    try {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // Carrega dados inicialização para o Android
      const androidInitializationSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      // Para informar ao plugin
      // configurações de inicialiação de diferentes plataformas
      // Ex: Linux, iOS, Android, etc.
      const initializationSettings =
          InitializationSettings(android: androidInitializationSettings);

      // Inicialização do plugin de notificação
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

      // Dados necessários para se criar um canal de notificações
      // e uma plataforma específica.
      // No caso estamos utilizando o Android.
      const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'canal001',
        'NOTIFICACAO_MEU_APP',
        importance: Importance.max,
        priority: Priority.high,
      );

      // Objeto que carrega os dados específico para a criação do canal
      platformChannelSpecifics =
          const NotificationDetails(android: androidPlatformChannelSpecifics);
      return true;
    } catch (error) {
      print(error.toString());
      notificationsChannelInitializationError =
          'Não foi possível inicializar o canal de notificações';
      return false;
    }
  }

  void onErrorWhenInitializingNotificationsChannel() {
    notificationsChannelInitializationError =
        'Não foi possível inicializar o canal de notificações';
  }

  Future<void> showNotification(
      String notificationTitle, String notificationBody) {
    // Cada notificação pode ser um id próprio. Adicionado aqui para
    // passar como argumento.
    const int idNotification = 0;
    print("Chamando notificação...");
    return flutterLocalNotificationsPlugin.show(
      idNotification,
      notificationTitle,
      notificationBody,
      platformChannelSpecifics,
    );
  }

  @override
  void initState() {
    super.initState();
    futureInitializeNotificationsChannel = initializeNotificationsChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Teste de notificação!"),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureInitializeNotificationsChannel,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Acionar notificação 1:',
                  ),
                  TextButton(
                    onPressed: () => showNotification(
                      "Notificação 1",
                      "Acesso o site.",
                    ),
                    child: const Text("Apresentar notificação 1"),
                  ),
                  const Text(
                    'Acionar notificação 2',
                  ),
                  TextButton(
                    onPressed: () => showNotification(
                      "Notificação 2",
                      "Outro conteúdo de notificação.",
                    ),
                    child: const Text("Apresentar notificação 1"),
                  ),
                ],
              );
            }

            // Caso haja um erro na inicialização do alerta
            if (notificationsChannelInitializationError.isNotEmpty) {
              return Center(
                child: Text(
                  notificationsChannelInitializationError,
                ),
              );
            }

            // Enquanto o Plugin de Notificação não tiver sido inicializado
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
