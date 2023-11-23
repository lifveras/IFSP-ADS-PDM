import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  late NotificationDetails notificationDetails;
  // Variável para receber a mensagem de erro em caso de falha no uso da
  // notificação.
  var notificationsChannelInitializationError = '';
  // Variável para receber o Future retornado pela
  // função initializeNotificationsChannel
  late Future<bool> futureInitializeNotificationsChannel;
  
  @override
  void initState() {
    super.initState();
    futureInitializeNotificationsChannel = initializeNotificationsChannel();
  }
  
  Future<bool> initializeNotificationsChannel() async {
    try {
      // Cria o objeto que controla a notificação
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      // Verifica se o usuário libera as notificações
      bool? response = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();

      // Carrega dados inicialização para o Android
      const androidInitializationSettings =
          AndroidInitializationSettings('@drawable/ifsp_logo');

      // Para informar ao plugin
      // configurações de inicialiação de diferentes plataformas
      // Ex: Linux, iOS, Android, etc.
      const initializationSettings =
          InitializationSettings(android: androidInitializationSettings);

      // Inicialização do plugin de notificação
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      // Dados necessários para se criar um canal de notificações
      // para uma plataforma específica.
      // No caso estamos utilizando o Android.
      const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'ifsp01',
        'IFSP Notificações',
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction('id_1', 'Ação 1'),
          AndroidNotificationAction('id_2', 'Ação 2'),
          AndroidNotificationAction('id_3', 'Ação 3'),
        ],
      );

      // Objeto que carrega os dados específico para a criação do canal
      notificationDetails =
          const NotificationDetails(android: androidPlatformChannelSpecifics);
      return true;

    } catch (error) {
      print(error.toString());
      notificationsChannelInitializationError =
          'Não foi possível inicializar o canal de notificações';
      return false;
    }
  }

  Future<void> showNotification(
      String notificationTitle, String notificationBody) {
    // Cada notificação pode ter um id próprio. Adicionado aqui para
    // passar como argumento.
    const int idNotification = 0;
    print("Chamando notificação...");
    return flutterLocalNotificationsPlugin.show(
      idNotification,
      notificationTitle,
      notificationBody,
      notificationDetails,
    );
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
                    child: const Text("Apresentar notificação 2"),
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
