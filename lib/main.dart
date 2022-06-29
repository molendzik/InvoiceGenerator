import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fakturomat',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fakturomat'),
        ),
        body: const Center(
          child: StartUserDataForm(),
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class StartUserDataForm extends StatefulWidget {
  const StartUserDataForm({Key? key}) : super(key: key);

  @override
  StartUserDataFormState createState() {
    return StartUserDataFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class StartUserDataFormState extends State<StartUserDataForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
        TextFormField( //Pole nazwa firmy
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Nazwa firmy',
          ),

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Wprowadź poprawną nazwę firmy';
            }
          return null;
          }
    ),
        TextFormField( //Pole NIP
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'NIP',
          ),
          keyboardType: TextInputType.number,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Wprowadź poprawny NIP';
            }
            return null;
          }
        ),
          TextFormField( //Pole nazwisko szefa
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nazwisko Szefa',
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Wprowadź poprawne nazwisko';
                }
                return null;
              }
          ),
          TextFormField( //Pole imię szefa
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Imię szefa',
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Wprowadź poprawne imię';
                }
                return null;
              }
          ),

          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Dane zostały zapisane')),
                );
              }
            },
            child: const Text('Zapisz'),
          ),
        ],
    ),
    );
  }
}


