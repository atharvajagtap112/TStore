class PaymentMethodModel {
  String image;
  String name;
  PaymentMethodModel({required this.image, required this.name });

  static PaymentMethodModel get empty=> PaymentMethodModel(image: "", name: "");
}