import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'dart:io'; // Untuk handling file
import 'package:image_picker/image_picker.dart'; 
import 'package:dotted_border/dotted_border.dart';

class EditGeografis extends StatefulWidget {
  @override
  _EditGeografisState createState() => _EditGeografisState();
}

class _EditGeografisState extends State<EditGeografis> {
  // Variabel untuk menyimpan tanggal yang dipilih
  DateTime? selectedDate;

  // Variabel untuk menyimpan gambar yang di-upload
  File? _image;

  // Fungsi untuk memilih tanggal
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Fungsi untuk mengambil gambar
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 90),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Edit Data',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildTextField('Nama Fasilitas'),
                        SizedBox(height: 20),
                        _buildTextField('Jenis Fasilitas'),
                        SizedBox(height: 16),
                        _buildTextField('Titik Koordinat lokasi Fasilitas'),
                        SizedBox(height: 20),
                        _buildTextField('Deskripsi Fasilitas', maxLines: 5),
                        SizedBox(height: 20),
                        _buildUploadImageField(),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Logika ketika tombol ditekan
                            },
                            child: Text(
                              'Edit Data',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 9),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 15),
                Text(
                  'Geografis',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk TextField dengan shadow
  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 35,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            ),
          ),
        ),
      ],
    );
  }
  // Widget untuk upload gambar dengan garis putus-putus dan icon upload
  Widget _buildUploadImageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gambar Lokasi Fasilitas',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid, // Border style garis solid luar
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: () => _showImageSourceDialog(),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.none,
                ),
              ),
              child: DottedBorder(
                color: Colors.grey,
                dashPattern: [6, 3], // Pola garis putus-putus
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                strokeWidth: 2,
                child: Center(
                  child: _image == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_file, color: Colors.grey), // Ikon upload
                            SizedBox(width: 8),
                            Text(
                              'Upload Photo',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Dialog untuk memilih sumber gambar (Galeri atau Kamera)
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Sumber Photo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
