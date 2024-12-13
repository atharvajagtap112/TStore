
class ProductAttributeModel {
   String? name;
   final List<String>? values;
  ProductAttributeModel({
    this.name,
     this.values,
  });
  
  //Json Formate
  tojson(){
    return{
      'Name':name,
      'Values':values
    };
  }

 // Map json oriented document snapshot form firebase to model
 factory ProductAttributeModel.fromJson(Map<String,dynamic> document){
  final data=document;
  if(document.isEmpty) return ProductAttributeModel();
  return ProductAttributeModel(
    // name: data['Name'],
    // values: data['Values']
    //Issue with values: This assumes that data['Values']
    // exists and can be converted to List<String>. If it is null or not iterable, this will throw an error.
    name: data.containsKey('Name')? data['Name']:'',
    values: List<String>.from(data['Values'])
  );
 }

}
