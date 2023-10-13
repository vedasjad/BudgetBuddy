import 'package:flutter/material.dart';

class TransactionCardWidget extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;
  const TransactionCardWidget({
    required this.title,
    required this.amount,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 8, 0, 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 135,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: color,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  ),
                ],
              ),
              Text(
                "\$$amount",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
