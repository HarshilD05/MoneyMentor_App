import 'package:flutter/material.dart';

class CustomSuccessScreen extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final Function onPressed;

  const CustomSuccessScreen({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Image(
                image: AssetImage(imageAsset),
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    onPressed();
                  },
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
