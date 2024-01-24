import 'package:flutter/material.dart';

class InputHp extends StatefulWidget {
  const InputHp({Key? key}) : super(key: key);

  @override
  State<InputHp> createState() => _InputHpState();
}

class _InputHpState extends State<InputHp> {
  String selectItem = 'Pilih Produsen';
  var valueItem = [
    'Pilih Produsen',
    'Apple',
    'Oppo',
    'Samsung',
    'Vivo',
    'Xiaomi'
  ];
  int selectValue = 1;
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecKode = TextEditingController();
  TextEditingController tecSeri = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal Respon'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecKode,
              decoration: InputDecoration(labelText: 'Kode Smartphone'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecNama,
              decoration: InputDecoration(labelText: 'Nama Smartphone'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecSeri,
              decoration: InputDecoration(labelText: 'Seri'),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                const ListTile(
                  title: Text('Jenis Jaringan'),
                ),
                ListTile(
                  title: const Text('4G'),
                  leading: Radio(
                    value: 1,
                    groupValue: selectValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectValue = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('5G'),
                  leading: Radio(
                    value: 2,
                    groupValue: selectValue,
                    onChanged: (int? value) {
                      setState(() {
                        selectValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 30),
            child: DropdownButton(
              items: valueItem.map((String itemValue) {
                return DropdownMenuItem(
                  value: itemValue,
                  child: Text(itemValue),
                );
              }).toList(),
              value: selectItem,
              onChanged: (value) {
                setState(() {
                  selectItem = value!;
                });
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke layar berikutnya
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationScreen(
                      kode: tecKode.text,
                      nama: tecNama.text,
                      seri: tecSeri.text,
                      jenisJaringan: selectValue == 1 ? '4G' : '5G',
                      produsen: selectItem,
                    ),
                  ),
                );
              },
              child: const Text('Simpan Data'),
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  final String kode;
  final String nama;
  final String seri;
  final String jenisJaringan;
  final String produsen;

  ConfirmationScreen({
    required this.kode,
    required this.nama,
    required this.seri,
    required this.jenisJaringan,
    required this.produsen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Smartphone: $kode'),
            Text('Nama Smartphone: $nama'),
            Text('Seri: $seri'),
            Text('Jenis Jaringan: $jenisJaringan'),
            Text('Produsen: $produsen'),
          ],
        ),
      ),
    );
  }
}
