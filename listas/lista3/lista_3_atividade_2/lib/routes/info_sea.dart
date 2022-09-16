import 'package:flutter/material.dart';
import 'package:lista_3_atividade_1/model/sea_cache.dart';
import 'package:provider/provider.dart';

class InfoSea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SeaCache>(
      builder: (context, cache, _) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cache.list[cache.index].name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 40,
                ),
                child: Image.network(cache.list[cache.index].picture),
              ),
              Text(cache.list[cache.index].description)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cache.list[cache.index].favorite = true;

              final snackBar = SnackBar(
                content: Text(
                    "${cache.list[cache.index].name} marcado como favorito"),
              );

              cache.index = -1;

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.favorite,
              color:
                  cache.list[cache.index].favorite ? Colors.red : Colors.grey,
              // cache.list[cache.index].favorite ? Colors.red : Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
