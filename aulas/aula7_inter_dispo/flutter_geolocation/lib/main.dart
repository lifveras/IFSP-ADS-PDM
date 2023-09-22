import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GPSWidget(),
    ),
  );
}

class GPSWidget extends StatelessWidget {
  // Retorna uma Stream do GPS. Nos fornece a posição do
  // dispositivo periodicamente, quando uma nova coordenada for obtida.
  static final _stream = Geolocator.getPositionStream();
  const GPSWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 20,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Disponível com a dependência flutter_svg
                  SvgPicture.asset(
                    // necessário registrar o arquivo svg como um asset no projeto.
                    // veja como em https://docs.flutter.dev/development/ui/assets-and-images#from-packages
                    "assets/geolocate.svg",
                    height: 70,
                  ),
                  // StreamBuilder permite construir a interface gráfica a partir de dados
                  // enviados periodicamente ao Widget.
                  StreamBuilder<Position>(
                    stream: _stream,
                    builder: (context, positionData) {
                      if (positionData.hasData) {
                        final data = positionData.data;

                        if (data != null) {
                          final lat = data.latitude.toStringAsFixed(5);
                          final lon = data.longitude.toStringAsFixed(5);
                          return Text("$lat | $lon");
                        } else {
                          return const Text("No data available.");
                        }
                      }

                      return const CircularProgressIndicator();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Semelhante ao StreamBuilder, mas executa apenas uma vez, quando a
                      // Future retorna o resultado da computação assíncrona.
                      FutureBuilder<String>(
                        future: locationPrint(),
                        builder: (context, snapshot) {
                          final text = snapshot.data ?? "";
                          return Text(text);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> locationPrint() async {
    // Uso da dependência geocoding para converter coordenadas lat long
    // no nome da localidade.
    final placemarks =
        await placemarkFromCoordinates(-22.93130895214896, -46.551674257886695);
    if (placemarks.isNotEmpty) {
      final result = placemarks[0];
      debugPrint("${result.administrativeArea}"); // Lazio
      debugPrint("${result.locality}"); // Rome
      debugPrint("${result.country}"); // Italy
      return "${result.administrativeArea} - ${result.locality} - ${result.country}";
    }

    return "Empty...";
  }
}
