import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: FormDemo(),
    ),
  ));
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person),
                hintText: 'Masukkan nama anda',
                labelText: 'Nama',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.key),
                hintText: 'Masukkan no telepon',
                labelText: 'Telepon',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.calendar_today),
                hintText: 'Masukkan tanggal lahir',
                labelText: 'Tanggal lahir',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tolong diisi terlebih dahulu';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: ElevatedButton(
                child: const Text('Kirim'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Data diproses'),
                    ));
                    // Lakukan sesuatu dengan data yang telah disimpan, misalnya, kirim ke server.
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
