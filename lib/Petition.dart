import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission handler package

class Petition extends StatefulWidget {
  const Petition({super.key});

  @override
  State<Petition> createState() => _PetitionState();
}

class _PetitionState extends State<Petition> {
  final _formKey = GlobalKey<FormState>();
  String? _complaintType;
  final List<String> _complaintTypes = ['Type 1', 'Type 2', 'Type 3', 'Type 4'];
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _requestPermission(); // Request permission on app launch
  }

  // Request permissions at app start
  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.photos.request();
    if (status.isGranted) {
      print("Permission granted");
    } else if (status.isDenied || status.isPermanentlyDenied) {
      print("Permission denied");
      openAppSettings(); // Direct the user to app settings
    }
  }

  // Pick image with permission handling
  Future<void> _pickImage() async {
    PermissionStatus status = await Permission.photos.request();
    if (status.isGranted) {
      try {
        final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        setState(() {
          _imageFile = pickedFile;
        });
      } catch (e) {
        print("Image picker error: $e");
      }
    } else {
      print("Permission not granted");
      openAppSettings(); // Direct user to app settings
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Petition submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info Link", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Complaint Type Dropdown
                DropdownButtonFormField<String>(
                  value: _complaintType,
                  items: _complaintTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Complaint Type",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _complaintType = newValue;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a complaint type' : null,
                ),
                const SizedBox(height: 20),
                // Brief Description Text Field
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Brief Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Please enter a description' : null,
                ),
                const SizedBox(height: 20),
                // Image/Video Picker
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Upload Image/Video',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 10),
                    _imageFile != null
                        ? Text("Selected: ${_imageFile!.name}", style: const TextStyle(color: Colors.black54))
                        : const Text("No file selected", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                const SizedBox(height: 30),
                // Submit Button
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Submit", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

