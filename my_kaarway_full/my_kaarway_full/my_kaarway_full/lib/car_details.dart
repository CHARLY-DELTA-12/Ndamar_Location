import 'package:flutter/material.dart';
import 'showReservationDetailsDialog.dart';

class CarDetailsPage extends StatefulWidget {
  final Map<String, dynamic> carDetails;

  CarDetailsPage({required this.carDetails});

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  DateTime selectedDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;
  int totalAmount = 0;
  bool chauffeurOption = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1000), // Date de début
      lastDate: DateTime.now(), // Date de fin (aujourd'hui)
    );

    if (pickedDate != null) {
      // Vérifier si la date choisie n'est pas nulle
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la voiture'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            Image.asset(
              widget.carDetails['image'],
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(height: 20.0),
            Text(
              widget.carDetails['name'],
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInfoCard(
                  icon: Icons.people,
                  label: 'Nombre de places',
                  value: widget.carDetails['seats'].toString(),
                ),
                buildInfoCard(
                  icon: Icons.speed,
                  label: 'Kilométrage',
                  value: widget.carDetails['kilometers'].toString(),
                ),
                buildInfoCard(
                  icon: Icons.attach_money,
                  label: 'Prix de location par jour',
                  value: widget.carDetails['rentAmount'],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildDateSelector('Date de début', startDate, (date) {
                  setState(() {
                    startDate = date;
                    updateTotalAmount();
                  });
                }),
                buildDateSelector('Date de fin', endDate, (date) {
                  setState(() {
                    endDate = date;
                    updateTotalAmount();
                  });
                }),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Avec Chauffeur'),
                Switch(
                  value: chauffeurOption,
                  onChanged: (value) {
                    setState(() {
                      chauffeurOption = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'Montant Total : \$$totalAmount',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    if (startDate != null && endDate != null) {
                      final newEndDate = endDate!.subtract(Duration(days: 1));
                      if (newEndDate.isAfter(startDate!)) {
                        setState(() {
                          endDate = newEndDate;
                          updateTotalAmount();
                        });
                      }
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 36.0,
                    color: Color(0xFF5202CF),
                  ),
                ),
                Text(
                  'Durée de location: ${calculateRentalDays()} jours',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (startDate != null && endDate != null) {
                      final newEndDate = endDate!.add(Duration(days: 1));
                      setState(() {
                        endDate = newEndDate;
                        updateTotalAmount();
                      });
                    }
                  },
                  icon: Icon(
                    Icons.add,
                    size: 36.0,
                    color: Color(0xFF5202CF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                if (startDate != null && endDate != null) {
                  await showReservationDetailsDialog(
                    context,
                    widget.carDetails,
                    startDate!,
                    endDate!,
                    totalAmount,
                    chauffeurOption,
                  );
                }
              },
              child: const Text(
                'Réserver',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5202CF),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(
      {required IconData icon, required String label, required String value}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(
              icon,
              size: 36.0,
            ),
            SizedBox(height: 10.0),
            Text(
              label,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 4.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateSelector(String label, DateTime? selectedDate,
      void Function(DateTime?) onDateSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                final selected = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                onDateSelected(selected);
              },
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xFF5202CF),
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              selectedDate != null
                  ? selectedDate.toLocal().toString().split(' ')[0]
                  : 'Sélectionner',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  int calculateRentalDays() {
    if (startDate != null && endDate != null) {
      final duration = endDate!.difference(startDate!);
      return duration.inDays;
    }
    return 0;
  }

  void updateTotalAmount() {
    if (startDate != null && endDate != null) {
      final duration = endDate!.difference(startDate!);
      final rentalAmount =
          int.parse(widget.carDetails['rentAmount'].substring(1));
      final amount = rentalAmount * duration.inDays;
      setState(() {
        totalAmount = amount;
      });
    }
  }
}
