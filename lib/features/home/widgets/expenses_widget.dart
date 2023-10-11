import 'package:flutter/material.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://tse4.mm.bing.net/th?id=OIP.itf5AVUXcelxNB3vRSb-QQAAAA&pid=Api&P=0&h=180",
            height: 55,
          ),
        ),
        title: const Text(
          "Walter White",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: const Text(
          "October 11, 2023",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Text(
          "-\$280",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
