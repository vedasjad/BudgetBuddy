import 'package:flutter/material.dart';

class ActivityCardWidget extends StatelessWidget {
  const ActivityCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 8, 0, 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 140,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.green,
                  ),
                  Text(
                    "SAVINGS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Text(
                "\$6078.88",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Icon(
                Icons.auto_graph_rounded,
                size: 80,
                color: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
