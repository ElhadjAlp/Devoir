import 'package:devoir_inscription/services/api_service.dart';
import 'package:flutter/material.dart';
import '../models/inscription.dart';


class InscriptionListScreen extends StatefulWidget {
  const InscriptionListScreen({Key? key}) : super(key: key);

  @override
  State<InscriptionListScreen> createState() => _InscriptionListScreenState();
}

class _InscriptionListScreenState extends State<InscriptionListScreen> {
  List<Inscription> inscriptions = [];
  bool isLoading = true;
  String? selectedClasse;

  Future<void> loadInscriptions() async {
    setState(() => isLoading = true);
    try {
      final data = await ApiService.fetchInscriptions(classe: selectedClasse);
      setState(() {
        inscriptions = data;
      });
    } catch (e) {
      // Gérer l'erreur
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    loadInscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          hint: const Text('Choisir une classe'),
          value: selectedClasse,
          items: ['L1 MAE', 'L2 MAE', 'L3 MAE'].map((String classe) {
            return DropdownMenuItem<String>(
              value: classe,
              child: Text(classe),
            );
          }).toList(),
          onChanged: (value) {
            setState(() => selectedClasse = value);
            loadInscriptions();
          },
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: inscriptions.length,
                  itemBuilder: (context, index) {
                    final inscription = inscriptions[index];
                    return ListTile(
                      title: Text('${inscription.nom} ${inscription.prenom}'),
                      subtitle: Text('${inscription.classe} - ${inscription.matricule}'),
                      trailing: Text(inscription.email),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
