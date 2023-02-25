import 'package:api_fetch_only/controller/opensea_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:api_fetch_only/models/opensea_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OpenseaController openseaController = Get.put(OpenseaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('opensea Api')),
        body: Obx(
          () => openseaController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount:
                      openseaController.openseaModel?.assets?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          openseaController.openseaModel?.assets![index].name ??
                              'no name'),
                      subtitle: Text(openseaController
                              .openseaModel?.assets![index].description ??
                          'no description'),
                      leading: openseaController
                                  .openseaModel?.assets![index].imageUrl ==
                              null
                          ? Icon(Icons.image)
                          : Image.network(openseaController
                              .openseaModel!.assets![index].imageUrl!),
                    );
                  }),
        ));
  }
}
