
// edit_profile_screen.dart
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String email;
  final String imageUrl;

  const EditProfileScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.imageUrl,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController imageUrlController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    ageController = TextEditingController(text: "45");
    phoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);
    imageUrlController = TextEditingController(text: widget.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1447),
      appBar: AppBar(
        title: const Text("Editar Perfil"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              _buildTextField(nameController, "Nombre completo", Icons.person, "Por favor ingresa tu nombre"),
              const SizedBox(height: 16),
              _buildTextField(ageController, "Edad", Icons.cake, "Ingresa una edad válida", inputType: TextInputType.number),
              const SizedBox(height: 16),
              _buildTextField(phoneController, "Teléfono", Icons.phone, "Número de teléfono requerido", inputType: TextInputType.phone),
              const SizedBox(height: 16),
              _buildTextField(emailController, "Correo electrónico", Icons.email_outlined, "Correo inválido", inputType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              _buildTextField(imageUrlController, "URL de imagen", Icons.image, "Ingresa una URL válida"),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      'name': nameController.text,
                      'phone': phoneController.text,
                      'email': emailController.text,
                      'imageUrl': imageUrlController.text,
                    });
                  }
                },
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text("Guardar Cambios"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String validatorMsg, {TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.purpleAccent,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF2C2155),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purpleAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        errorStyle: TextStyle(color: Colors.redAccent.shade100),
      ),
      validator: (value) => value == null || value.trim().isEmpty ? validatorMsg : null,
    );
  }
}
