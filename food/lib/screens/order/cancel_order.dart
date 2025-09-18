import 'package:flutter/material.dart';
import 'package:food_delivery_app/widget/custom_background.dart';


class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  int? selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  final List<String> reasons = [
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
    "Lorem ipsum dolor sit amet",
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      title: "Cancel Order",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Prosaent pellentesque congue lorem, vel tincidunt tortor.",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          const SizedBox(height: 20),

          // Reasons List
          Expanded(
            child: ListView.builder(
              itemCount: reasons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(reasons[index]),
                  trailing: Radio<int>(
                    value: index,
                    groupValue: selectedReason,
                    onChanged: (value) {
                      setState(() {
                        selectedReason = value;
                      });
                    },
                    activeColor: Colors.orange,
                  ),
                );
              },
            ),
          ),

          // Other Reason
          const SizedBox(height: 10),
          const Text("Others"),
          const SizedBox(height: 6),
          TextField(
            controller: _otherReasonController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: "Others reason...",
              filled: true,
              fillColor: Colors.yellow[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
