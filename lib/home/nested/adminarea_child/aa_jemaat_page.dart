import 'package:MobileGKI/common/widget/c_rondedimg.dart';
import 'package:MobileGKI/data/crud_state/jemaatlisting.dart';
import 'package:MobileGKI/data/jemaat/jemaat.dart';
import 'package:MobileGKI/home/nested/adminarea_child/edit/crud_aa_jemaat.dart';
import 'package:MobileGKI/utils/constrains/image_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jemaat extends StatefulWidget {
  const Jemaat({super.key});

  @override
  State<Jemaat> createState() => _JemaatState();
}

class _JemaatState extends State<Jemaat> {
  late final Future<List<JemaatJSON>> fetchdata;
  @override
  void initState() {
    super.initState();
    fetchdata = fecthJemaat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jemaat"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: FutureBuilder<List<JemaatJSON>>(
          future: fetchdata,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<JemaatJSON>? fetchdata = snapshot.data;
              return ListView.builder(
                addAutomaticKeepAlives: false,
                itemCount: fetchdata!.length,
                itemBuilder: (_, index) {
                  final d_all = fetchdata[index];
                  return JemaatItem(
                    imngUrl: Filemonimages.pendeta1,
                    noInduk: d_all.jemaatId.toString(),
                    nama: d_all.name.toString(),
                    alamat: d_all.alamat.toString(),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Koneksi ke Server Terputus"),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
          child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}

class JemaatItem extends StatelessWidget {
  const JemaatItem({
    super.key,
    required this.noInduk,
    required this.nama,
    required this.alamat,
    required this.imngUrl,
  });
  final String noInduk, nama, alamat, imngUrl;

  @override
  Widget build(BuildContext context) {
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
                imageUrl: imngUrl,
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
                      noInduk,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      nama,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(alamat),
                  ],
                ),
              ),
              Container(
                width: 40,
                child: IconButton(
                  onPressed: () => Get.to(() => EditJemaat()),
                  icon: Icon(Icons.edit),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
