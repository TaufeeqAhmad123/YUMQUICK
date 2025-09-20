import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String selectedTab = 'Active';

  // Example orders list
  List<Map<String, dynamic>> orders = [
    {
      "title": "Strawberry shake",
      "price": 20.0,
      "date": "29 Nov, 01:20 pm",
      "items": "2 Items",
      "image":
          "https://images.unsplash.com/photo-1544145945-f90425340c7e?w=400&h=400&fit=crop"
    },
    {
      "title": "Cheese Pizza",
      "price": 35.0,
      "date": "28 Nov, 07:10 pm",
      "items": "1 Item",
      "image":
          "https://images.unsplash.com/photo-1601924582971-c9f7f2eab111?w=400&h=400&fit=crop"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.yellowbase),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'My Orders',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),

              // Content Container
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Tab Bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              _buildTab('Active'),
                              _buildTab('Completed'),
                              _buildTab('Cancelled'),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Orders List
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: orders.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.receipt_long,
                                          size: 60, color: Colors.grey),
                                      SizedBox(height: 10),
                                      Text(
                                        "You don't have any active orders at the moment",
                                        style: GoogleFonts.leagueSpartan(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: orders.length,
                                  itemBuilder: (context, index) {
                                    final order = orders[index];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: _buildOrderCard(order),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    final isSelected = selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF8C42) : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, dynamic> order) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(order["image"]),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Order Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '\$${order["price"]}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF8C42),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order["date"],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      order["items"],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8C42),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Cancel Order',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFF8C42)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Track Driver',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF8C42),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
