import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar',
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  DateTime? _dateOfBirth;
  String _gender = '';
  String _phoneNumber = '';
  String _email = '';
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFC0F3FF), Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    'Daftar',
                    style: GoogleFonts.poppins(
                      fontSize: 24.0,
                      color: Color(0xFF0C0A91),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Sepertinya Anda pengguna baru. Mohon lengkapi data Anda',
                    style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        labelStyle: GoogleFonts.poppins(),
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama Lengkap harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      labelStyle: GoogleFonts.poppins(),
                    ),
                    readOnly: true,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((pickedDate) {
                        if (pickedDate == null) return;
                        setState(() {
                          _dateOfBirth = pickedDate; // Simpan objek DateTime
                        });
                      });
                    },
                    validator: (value) {
                      if (_dateOfBirth == null) { // Ubah validasi untuk memeriksa apakah _dateOfBirth tidak null
                        return 'Tanggal Lahir harus diisi';
                      }
                      return null;
                    },
                    controller: TextEditingController(text: _dateOfBirth != null ? "${_dateOfBirth!.day}-${_dateOfBirth!.month}-${_dateOfBirth!.year}" : ''), // Tambahkan controller untuk menampilkan tanggal yang dipilih
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text(
                        'Jenis Kelamin',
                        style: GoogleFonts.poppins(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _gender = _gender == 'PRIA' ? '' : 'PRIA';
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return _gender == 'PRIA'
                                    ? Colors.blue
                                    : null;
                              },
                            ),
                          ),
                          icon: _gender == 'PRIA'
                              ? Icon(Icons.check, color: Colors.white)
                              : Icon(Icons.male, color: Colors.grey),
                          label: Text(
                            'PRIA',
                            style: TextStyle(
                              color: _gender == 'PRIA'
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            setState(() {
                              _gender = _gender == 'WANITA' ? '' : 'WANITA';
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                return _gender == 'WANITA'
                                    ? Colors.blue
                                    : null;
                              },
                            ),
                          ),
                          icon: _gender == 'WANITA'
                              ? Icon(Icons.check, color: Colors.white)
                              : Icon(Icons.female, color: Colors.grey),
                          label: Text(
                            'WANITA',
                            style: TextStyle(
                              color: _gender == 'WANITA'
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(
                          labelText: 'Nomor Ponsel',
                          labelStyle: GoogleFonts.poppins(),
                        ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor Ponsel harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _phoneNumber = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.poppins(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email harus diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value!,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        onChanged: (newValue) {
                          setState(() {
                            _isAgreed = newValue!;
                          });
                        },
                      ),
                      SizedBox(width: 6.0),
                      Flexible(
                        child: Text(
                          'Saya yakin bahwa data di atas adalah informasi akurat, lengkap, dan terbaru tentang saya.',
                          style: GoogleFonts.poppins(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isAgreed
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Proses data yang telah diisi
                                print('Nama: $_name');
                                print('Tanggal Lahir: $_dateOfBirth');
                                print('Jenis Kelamin: $_gender');
                                print('Nomor Ponsel: $_phoneNumber');
                                print('Email: $_email');
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return _isAgreed ? Colors.green : Colors.grey;
                          },
                        ),
                      ),
                      child: Text(
                        'DAFTAR',
                        style: GoogleFonts.poppins(
                          color:Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
