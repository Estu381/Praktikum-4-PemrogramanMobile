import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "Estu241" && password == "estu1234566") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print("Hello");
    }
  }

  void _guestLogin() {
    // Perform guest login logic here.
    // For example, you can navigate to the HomePage directly.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 10), // Add some space
              ElevatedButton(
                onPressed: _guestLogin,
                child: Text('Guest Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hallo,',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari sesuatu...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CardWidget(
                    title: 'Index Masa Tubuh (BMI)',
                    color: Colors.blue,
                    resultText: 'Hasil BMI',
                  ),
                  CardWidget(
                    title: 'Energi Basal (BMR)',
                    color: Colors.red,
                    resultText: 'Hasil BMR',
                  ),
                  CardWidget(
                    title: 'Energi Expenditure (TEE)',
                    color: Colors.green,
                    resultText: 'Hasil TEE',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String resultText;

  CardWidget({required this.title, required this.color, required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(resultText),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage(title: title)),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(12.0),
                  ),
                  child: Text('Cek Sekarang', style: TextStyle(color: color)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  final String title;

  NewPage({required this.title});

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  // Variabel jenis kelamin
  String? gender;
  double bmrResult = 0.0;
  double carbsRequirement = 0.0;
  double fatRequirement = 0.0;
  double proteinRequirement = 0.0;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void calculateNutritionRequirements() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    int age = int.tryParse(ageController.text) ?? 0;

    if (weight > 0 && height > 0 && gender != null) {
      double bmr;

      if (gender == 'Pria') {
        // Rumus Harris-Benedict untuk Pria
        bmr = 88.362 + (13.397 * weight) + (4.799 * height * 100) - (5.677 * age);
      } else {
        // Rumus Harris-Benedict untuk Wanita
        bmr = 447.593 + (9.247 * weight) + (3.098 * height * 100) - (4.330 * age);
      }

      setState(() {
        bmrResult = bmr;
        // Menghitung kebutuhan karbohidrat, lemak, dan protein dalam gram
        carbsRequirement = (bmrResult * 0.5) / 4.0; // Kebutuhan karbohidrat dalam gram
        fatRequirement = (bmrResult * 0.3) / 9.0;   // Kebutuhan lemak dalam gram
        proteinRequirement = (bmrResult * 0.2) / 4.0; // Kebutuhan protein dalam gram
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 224, 224),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // Latar belakang container warna putih
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Pilihan jenis kelamin dalam Container
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white, // Latar belakang jenis kelamin warna putih
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: <Widget>[
                            Radio<String>(
                              value: 'Pria',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            Text('Pria'),
                            Radio<String>(
                              value: 'Wanita',
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            Text('Wanita'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(labelText: 'Berat Badan (kg)'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: heightController,
                    decoration: InputDecoration(labelText: 'Tinggi Badan (meter)'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: ageController,
                    decoration: InputDecoration(labelText: 'Usia (tahun)'),
                    keyboardType: TextInputType.number,
                  ),
                  // Memindahkan tombol "Hitung Nutrisi" ke sudut kiri bawah dan mengubah warnanya menjadi merah
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        calculateNutritionRequirements();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Warna merah
                      ),
                      child: Text('Hitung Nutrisi'),
                    ),
                  ),
                  // Memindahkan hasil BMR dan kebutuhan nutrisi ke sudut kiri bawah dan mengubah warnanya menjadi merah
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Hasil perhitungan BMR berada pada: ${bmrResult.toStringAsFixed(2)} kcal',
                          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 6, 6, 6)),
                        ),
                        Text('Kamu memerlukan: '),
                        Text(
                          'Kebutuhan Karbohidrat: ${carbsRequirement.toStringAsFixed(2)} gram',
                          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 8, 8, 8)),
                        ),
                        Text(
                          'Kebutuhan Lemak: ${fatRequirement.toStringAsFixed(2)} gram',
                          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 8, 8, 8)),
                        ),
                        Text(
                          'Kebutuhan Protein: ${proteinRequirement.toStringAsFixed(2)} gram',
                          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 7, 7, 7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
