import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Retorna o objeto do tipo List<CameraDescription>
  final cameras = await availableCameras();
  final firstCamera = cameras.first; // retorna a primeira câmera disponível

  runApp(MaterialApp(
    home: TakePicture(
      camera: firstCamera,
    ),
  ));
}

class TakePicture extends StatefulWidget {
  // CameraDescription é o tipo de objeto que representa uma câmera
  final CameraDescription camera;
  TakePicture({required this.camera});

  @override
  State<StatefulWidget> createState() {
    return _TakePictureState();
  }
}

class _TakePictureState extends State<TakePicture> {
  // CameraController obtem a imagem de uma câmera
  late final CameraController _controller;
  late final Future<void> _initController;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // widget representa o campo da classe TakePicture.
      widget.camera, // O campo câmera foi definido em TakePicture
      ResolutionPreset.max, // resolução da câmera setada para máxima
    );

    // Dá início ao processo de se conectar com a camera.
    // Não se sabe quando a conexão com a camera será finalizada,
    // logo, initialize() retorna uma Future.
    _initController = _controller.initialize();
  }

  @override
  // É invocado quando o Widget for removido da árvore de Widgets
  void dispose() {
    _controller.dispose(); // Libera a câmera.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Precisamos utilizar o FutureBuilder, pois não se sabe quando a
          // câmera será conectada.
          FutureBuilder<void>(
            future:
                _initController, // Future que aguarda a conexão com a câmera.
            builder: (context, snapshot) {
              // Se a conexão com a câmera tiver sido estabelecida
              if (snapshot.connectionState == ConnectionState.done) {
                return Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // CameraPreview é um Widget da biblioteca "camera" que
                      // permite visualizar a imagem da camera em tempo real.
                      child: CameraPreview(_controller),
                    ),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),

          // Botão para salvar a imagem da camera.

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
              ),
            ),
            margin: EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                _takePhoto(context);
              },
              color: Colors.red,
              icon: Icon(Icons.photo_camera),
            ),
          )
        ],
      ),
    );
  }

  void _takePhoto(BuildContext context) async {
    // Garante que o controller da câmera esteja pronto quando uma foto for tirada.
    await _initController;

    // Nome do arquivo e caminho
    // final dir = await getTemporaryDirectory(); // função do pacote path_provider
    // final dir = await getExternalStorageDirectory() ?? Directory("/");
    final dir = await getDownloadsDirectory() ?? Directory("/");
    final name =
        "img_${DateTime.now()}.png"; // usando a data no nome, evita-se conflito de nomes de arquivos

    // Armazena a foto em uma dado local
    final fullPath = path.join(dir.path, name); // path é
    final image = await _controller.takePicture();
    // Salva a foto
    // image.saveTo(fullPath);
    Uint8List byteImage = await image.readAsBytes();
    ImageGallerySaver.saveImage(byteImage);

    String texto = "Foto salva em $fullPath";
    // Snackback para apresentar que a foto foi salva
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Imagem salva"),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }
}
