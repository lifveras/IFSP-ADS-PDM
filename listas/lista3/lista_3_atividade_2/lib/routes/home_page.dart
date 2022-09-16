import 'package:flutter/material.dart';
import 'package:lista_3_atividade_1/model/sea_cache.dart';
import 'package:lista_3_atividade_1/routers.dart';
import 'package:provider/provider.dart';

import '../widgets/list_item_sea.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SeaCache>(
        builder: (context, cache, child) {
          return ListView.builder(
            itemCount: cache.list.length,
            itemBuilder: (context, index) {
              return ListItemSea(
                name: cache.list[index].name,
                description: cache.list[index].description,
                image: cache.list[index].picture,
                onTap: () {
                  cache.index = index;
                  Navigator.of(context).pushNamed(RouteGenerator.infoSea);
                },
              );
            },
          );
        },
      ),
    );
  }
}
