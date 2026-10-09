import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fly_buy_brand_project/ul%20designs/cart_page.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  // ==========================================================
  // THEME COLORS
  // ==========================================================

  static const Color darkColor = Color(0xff0A0D12);
  static const Color darkSurface = Color(0xff171B22);
  static const Color bronze = Color(0xffB87820);
  static const Color darkBronze = Color(0xff855300);
  static const Color pageBackground = Color(0xffF8F8F7);
  static const Color cream = Color(0xffEFE8DC);
  static const Color softCream = Color(0xffF3EEE6);
  static const Color borderColor = Color(0xffE7E2DB);
  static const Color textGrey = Color(0xff77716A);
  static const Color lightGrey = Color(0xffA39B91);
  static const Color stockGreen = Color(0xff3EAD58);

  // ==========================================================
  // FORM STATE
  // ==========================================================

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController(text: 'Vikram Malhotra');

  final TextEditingController _phoneController =
      TextEditingController(text: '+91 98765 43210');

  final TextEditingController _addressController =
      TextEditingController(text: 'Suite 402, Signature Towers, MG Road');

  final TextEditingController _cityController =
      TextEditingController(text: 'Mumbai');

  final TextEditingController _stateController =
      TextEditingController(text: 'Maharashtra');

  final TextEditingController _pinController =
      TextEditingController(text: '400001');

  final TextEditingController _countryController =
      TextEditingController(text: 'India');

  bool _sameAsShipping = true;
  bool _expressShipping = true;
  bool _encryptedPayment = true;

  String _paymentMethod = 'card';
  String _activeStep = 'Checkout';

  // ==========================================================
  // SAMPLE ORDER DATA
  // Replace with your actual cart data.
  // ==========================================================

  final List<Map<String, dynamic>> _orderItems = [
    {
      'name': 'Dita Flight Grand',
      'description': 'Gold & Matte Black • Qty: 1',
      'price': 999,
      'image': 'assets/cartier_sunglass.jpg',
      'quantity': 1,
    },
    {
      'name': 'Marc Jacobs Classic',
      'description': 'Classic Tortoise • Qty: 1',
      'price': 999,
      'image': 'assets/sunglasses_image.jpg',
      'quantity': 1,
    },
  ];

  // ==========================================================
  // CALCULATIONS
  // ==========================================================

  double get subtotal {
    return _orderItems.fold<double>(
      0,
      (sum, item) =>
          sum +
          (item['price'] as num).toDouble() *
              (item['quantity'] as num).toDouble(),
    );
  }

  double get shipping => _expressShipping ? 100 : 0;

  double get tax => subtotal * 0.18;

  double get total => subtotal + shipping + tax;

  String _price(num value) {
    final String digits = value.round().toString();

    if (digits.length <= 3) {
      return '₹$digits';
    }

    final String lastThree = digits.substring(digits.length - 3);
    String remaining = digits.substring(0, digits.length - 3);

    final List<String> groups = [];

    while (remaining.length > 2) {
      groups.insert(0, remaining.substring(remaining.length - 2));
      remaining = remaining.substring(0, remaining.length - 2);
    }

    if (remaining.isNotEmpty) {
      groups.insert(0, remaining);
    }

    return '₹${groups.join(',')},$lastThree';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _pinController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  // ==========================================================
  // REUSABLE SECTION CARD
  // ==========================================================

  Widget _sectionCard({
    required Widget child,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11.r),
        border: Border.all(color: const Color(0xffECE8E2)),
      ),
      child: child,
    );
  }

  Widget _sectionTitle({
    required IconData icon,
    required String title,
    String? trailing,
  }) {
    return Row(
      children: [
        Icon(icon, color: darkBronze, size: 16.sp),
        SizedBox(width: 7.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: darkColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        if (trailing != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 7.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              color: softCream,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Text(
              trailing,
              style: TextStyle(
                color: textGrey,
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  // ==========================================================
  // FORM FIELD
  // ==========================================================

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: textGrey,
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: TextStyle(
            color: darkColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: lightGrey,
              fontSize: 10.sp,
            ),
            filled: true,
            fillColor: const Color(0xffF5F5F4),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 11.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(
                color: Color(0xffF0EEEA),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(color: bronze),
            ),
            errorStyle: TextStyle(fontSize: 9.sp),
          ),
        ),
      ],
    );
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  // ==========================================================
  // CHECKOUT PROGRESS
  // ==========================================================

  Widget _buildProgress() {
    final steps = ['Cart', 'Checkout', 'Payment'];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: List.generate(steps.length, (index) {
          final bool selected = steps[index] == _activeStep;
          final bool completed = index < steps.indexOf(_activeStep);

          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (steps[index] == 'Checkout') {
                        setState(() => _activeStep = 'Checkout');
                      } else if (steps[index] == 'Payment') {
                        setState(() => _activeStep = 'Payment');
                      } else {
                        setState(() => _activeStep = 'Cart');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 7.h),
                      decoration: BoxDecoration(
                        color: selected ? bronze : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            completed
                                ? Icons.check_circle
                                : index == 0
                                    ? Icons.shopping_cart_outlined
                                    : index == 1
                                        ? Icons.lock_outline
                                        : Icons.credit_card_outlined,
                            size: 11.sp,
                            color: selected
                                ? Colors.white
                                : textGrey,
                          ),
                          SizedBox(width: 4.w),
                          Flexible(
                            child: Text(
                              steps[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : textGrey,
                                fontSize: 9.sp,
                                fontWeight: selected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (index != steps.length - 1)
                  Container(
                    width: 8.w,
                    height: 1,
                    color: borderColor,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ==========================================================
  // SHIPPING ADDRESS
  // ==========================================================

  Widget _buildShippingAddress() {
    return _sectionCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
              icon: Icons.location_on_outlined,
              title: 'Shipping Address',
              trailing: 'PRIMARY',
            ),
            SizedBox(height: 14.h),
            _buildField(
              label: 'Full Name',
              controller: _nameController,
              validator: _requiredValidator,
            ),
            SizedBox(height: 10.h),
            _buildField(
              label: 'Phone Number',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              validator: _requiredValidator,
            ),
            SizedBox(height: 10.h),
            _buildField(
              label: 'Street Address',
              controller: _addressController,
              validator: _requiredValidator,
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildField(
                    label: 'City',
                    controller: _cityController,
                    validator: _requiredValidator,
                  ),
                ),
                SizedBox(width: 7.w),
                Expanded(
                  flex: 5,
                  child: _buildField(
                    label: 'State',
                    controller: _stateController,
                    validator: _requiredValidator,
                  ),
                ),
                SizedBox(width: 7.w),
                Expanded(
                  flex: 4,
                  child: _buildField(
                    label: 'Pincode',
                    controller: _pinController,
                    keyboardType: TextInputType.number,
                    validator: _requiredValidator,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            _buildField(
              label: 'Country',
              controller: _countryController,
              validator: _requiredValidator,
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // BILLING ADDRESS
  // ==========================================================

  Widget _buildBillingAddress() {
    return _sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            icon: Icons.home_work_outlined,
            title: 'Billing Address',
          ),
          SizedBox(height: 9.h),
          InkWell(
            onTap: () {
              setState(() {
                _sameAsShipping = !_sameAsShipping;
              });
            },
            borderRadius: BorderRadius.circular(7.r),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 9.w,
                vertical: 9.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F4),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Row(
                children: [
                  Icon(
                    _sameAsShipping
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: _sameAsShipping ? bronze : lightGrey,
                    size: 17.sp,
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Same as shipping address',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Billing details will mirror your shipping address',
                          style: TextStyle(
                            color: textGrey,
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!_sameAsShipping) ...[
            SizedBox(height: 12.h),
            const Text(
              'Enter a separate billing address in the address form above '
              'before proceeding.',
              style: TextStyle(color: textGrey),
            ),
          ],
        ],
      ),
    );
  }

  // ==========================================================
  // PAYMENT METHOD
  // ==========================================================

  Widget _paymentOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
    Widget? trailing,
  }) {
    final bool selected = _paymentMethod == value;

    return InkWell(
      onTap: () {
        setState(() {
          _paymentMethod = value;
        });
      },
      borderRadius: BorderRadius.circular(8.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xffF3EEE6)
              : const Color(0xffF7F7F6),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: selected ? bronze : const Color(0xffEEEAE4),
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: selected ? bronze : const Color(0xffD5D1CA),
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            Icon(icon, color: darkBronze, size: 17.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 10.5.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textGrey,
                      fontSize: 8.5.sp,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return _sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _sectionTitle(
                  icon: Icons.credit_card_outlined,
                  title: 'Payment Method',
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFBE8C9),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  'Encrypted',
                  style: TextStyle(
                    color: darkBronze,
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _paymentOption(
            value: 'card',
            title: 'Cards, UPI & NetBanking',
            subtitle: 'Instant checkout with Razorpay Secure',
            icon: Icons.account_balance_wallet_outlined,
            trailing: Icon(
              Icons.bolt,
              color: bronze,
              size: 16.sp,
            ),
          ),
          _paymentOption(
            value: 'cod',
            title: 'Cash on Delivery',
            subtitle: 'Pay upon arrival (+₹50 courier surcharge)',
            icon: Icons.payments_outlined,
          ),
          if (_paymentMethod == 'card') ...[
            Wrap(
              spacing: 5.w,
              runSpacing: 5.h,
              children: ['UPI', 'VISA', 'MC', 'RUPAY'].map((label) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.r),
                    border: Border.all(color: borderColor),
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  // ==========================================================
  // ORDER SUMMARY
  // ==========================================================

  Widget _buildOrderSummary() {
    final double paymentSurcharge =
        _paymentMethod == 'cod' ? 50 : 0;
    final double finalTotal = total + paymentSurcharge;

    return _sectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            icon: Icons.receipt_long_outlined,
            title: 'Order Summary',
            trailing: '${_orderItems.length} ITEMS',
          ),
          SizedBox(height: 12.h),

          ..._orderItems.map((item) {
            return Padding(
              padding: EdgeInsets.only(bottom: 9.h),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image.asset(
                      item['image'] as String,
                      width: 48.w,
                      height: 43.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 48.w,
                          height: 43.h,
                          color: softCream,
                          child: Icon(
                            Icons.image_outlined,
                            color: textGrey,
                            size: 18.sp,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          item['description'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textGrey,
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    _price(
                      (item['price'] as num) *
                          (item['quantity'] as num),
                    ),
                    style: TextStyle(
                      color: darkColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 3.h),
          const Divider(color: borderColor, height: 1),
          SizedBox(height: 9.h),

          _summaryRow('Subtotal (${_orderItems.length} items)', _price(subtotal)),
          SizedBox(height: 7.h),
          _summaryRow(
            'Shipping',
            shipping == 0 ? 'FREE' : _price(shipping),
            valueColor: shipping == 0 ? stockGreen : textGrey,
          ),
          SizedBox(height: 7.h),
          _summaryRow('Estimated GST (18%)', _price(tax)),
          if (_paymentMethod == 'cod') ...[
            SizedBox(height: 7.h),
            _summaryRow('COD surcharge', _price(50)),
          ],

          SizedBox(height: 9.h),
          const Divider(color: borderColor, height: 1),
          SizedBox(height: 9.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Total Amount',
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                _price(finalTotal),
                style: TextStyle(
                  color: darkBronze,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Inclusive of all applicable taxes',
              style: TextStyle(
                color: lightGrey,
                fontSize: 8.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    Color valueColor = darkColor,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: textGrey,
              fontSize: 10.sp,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // CHECKOUT BUTTON
  // ==========================================================

  Widget _buildCheckoutButton() {
    final double paymentSurcharge =
        _paymentMethod == 'cod' ? 50 : 0;

    return SizedBox(
      width: double.infinity,
      height: 43.h,
      child: ElevatedButton(
        onPressed: () {
          FocusScope.of(context).unfocus();

          if (!_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please complete all required address fields.'),
              ),
            );
            return;
          }

          if (_orderItems.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Your order is empty.')),
            );
            return;
          }

          final String paymentName =
              _paymentMethod == 'cod'
                  ? 'Cash on Delivery'
                  : 'Cards, UPI & NetBanking';

          showDialog<void>(
            context: context,
            builder: (dialogContext) {
              return AlertDialog(
                title: const Text('Confirm Order'),
                content: Text(
                  'Payment method: $paymentName\n'
                  'Total: ${_price(total + paymentSurcharge)}\n\n'
                  'Connect your payment gateway and order API '
                  'to complete the purchase.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text('CANCEL'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Checkout UI is ready. Payment processing '
                            'has not been connected yet.',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bronze,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('CONTINUE'),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: darkSurface,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
        child: Row(
          children: [
            Icon(Icons.lock_outline, size: 13.sp),
            SizedBox(width: 7.w),
            Expanded(
              child: Text(
                'PROCEED TO PAYMENT',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            Text(
              _price(total + paymentSurcharge),
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(Icons.arrow_forward_rounded, size: 15.sp),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // TRUST BENEFITS
  // ==========================================================

  Widget _buildTrustBenefits() {
    final benefits = [
      {
        'icon': Icons.verified_user_outlined,
        'title': '256-BIT SSL',
      },
      {
        'icon': Icons.local_shipping_outlined,
        'title': 'EXPRESS DISPATCH',
      },
      {
        'icon': Icons.assignment_return_outlined,
        'title': '10-DAY RETURNS',
      },
    ];

    return Row(
      children: benefits.map((benefit) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.symmetric(
              horizontal: 3.w,
              vertical: 9.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xffF2F0EB),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              children: [
                Icon(
                  benefit['icon'] as IconData,
                  color: darkBronze,
                  size: 16.sp,
                ),
                SizedBox(height: 4.h),
                Text(
                  benefit['title'] as String,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textGrey,
                    fontSize: 7.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

 

 Widget _buildNavItem(IconData icon, String label) {
  return Expanded(
    child: InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        if (label == 'Cart') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$label page is not connected yet.'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: Colors.white60),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 8.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      resizeToAvoidBottomInset: true,

      // APP BAR
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 88.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FBB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w800,
                  height: 0.95,
                ),
              ),
              Text(
                'FLYBUYBRAND',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 7.sp,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search is not connected yet.')),
              );
            },
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
              size: 22.sp,
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Shopping bag is not connected yet.'),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                  size: 21.sp,
                ),
              ),
              Positioned(
                right: 8.w,
                top: 5.h,
                child: Container(
                  width: 14.w,
                  height: 14.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: bronze,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${_orderItems.length}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 5.w),
        ],
      ),

      // BODY
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  14.w,
                  10.h,
                  14.w,
                  18.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PAGE HEADER
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'YOUR PURCHASE',
                                style: TextStyle(
                                  color: darkBronze,
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  color: darkColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7.r),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.verified_user_outlined,
                                color: darkBronze,
                                size: 12.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'SECURE SSL',
                                style: TextStyle(
                                  color: textGrey,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 9.h),
                    _buildProgress(),
                    SizedBox(height: 11.h),

                    // SHIPPING
                    _buildShippingAddress(),
                    SizedBox(height: 9.h),

                    // BILLING
                    _buildBillingAddress(),
                    SizedBox(height: 9.h),

                    // PAYMENT
                    _buildPaymentMethod(),
                    SizedBox(height: 9.h),

                    // SUMMARY
                    _buildOrderSummary(),
                    SizedBox(height: 11.h),

                    // CHECKOUT ACTION
                    _buildCheckoutButton(),
                    SizedBox(height: 7.h),

                    Center(
                      child: Text(
                        'By placing your order, you agree to our Terms of Service and Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textGrey,
                          fontSize: 8.sp,
                          height: 1.4,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),
                    _buildTrustBenefits(),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ),

            // FIXED BOTTOM NAVIGATION
           
          ],
        ),
      ),
    );
  }
}