// class UpdateProductPage extends StatelessWidget {
//   static String id = "update product";
//
//   @override
//   Widget build(BuildContext context) {
//     final ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Update Product"),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CustomTextField(hintText: product.title),
//             const SizedBox(height: 10),
//             CustomTextField(hintText: product.description),
//             const SizedBox(height: 10),
//             CustomTextField(hintText: product.price.toString(), type: TextInputType.number),
//             const SizedBox(height: 10),
//             CustomButton(onTap: () {}, text: "Update"),
//           ],
//         ),
//       ),
//     );
//   }
// }