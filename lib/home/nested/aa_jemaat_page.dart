import 'package:MobileGKI/common/widget/c_appabar.dart';
import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';

class Jemaat extends StatelessWidget {
  const Jemaat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jemaat"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          itemCount: 16,
          itemBuilder: (_, index) {
            return Card(
              elevation: 6,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                height: 100,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundedIMG(
                        imageUrl: Filemonimages.pendeta1,
                        height: 80,
                      ),
                      Container(
                        width: 200,
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Induk",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Text("Nama"),
                            Text('Alamat'),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
