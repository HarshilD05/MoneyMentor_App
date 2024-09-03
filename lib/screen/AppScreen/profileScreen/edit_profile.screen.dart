import 'package:flutter/material.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _username = '';
  String _email = '';
  String _dateOfBirth = '';

  // Placeholder methods to simulate data fetching and saving
  Future<void> _fetchData() async {
    // Simulate fetching data from a backend or local storage
    setState(() {
      _name = 'Coding with T';
      _username = 'codingwitht';
      _email = 'codingwith_t@example.com';
      _dateOfBirth = '1994-10-10';
    });
  }

  Future<void> _saveChanges() async {
    // Simulate saving changes to a backend or local storage
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Show a success message or perform other actions
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Profile picture (replace with an image picker or uploader)
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your asset path
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _name = value!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _username,
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username.';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _username = value!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    }
                    // Regular expression for email validation
                    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Invalid email address.';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() => _email = value!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _dateOfBirth,
                  decoration: const InputDecoration(labelText: 'Date of Birth'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth.';
                    }
                    return null; // Add logic for date validation if needed
                  },
                  onSaved: (value) => setState(() => _dateOfBirth = value!),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveChanges,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
