  
import 'package:get_storage/get_storage.dart';

class TLocalStorage {
   
   
   late final GetStorage _storage; // assiging 
    
    //Singleton instance
   // Making it static so that we can use same instance other class
   //This static field holds the single instance of the TLocalStorage class.
   static TLocalStorage? _instance;
     

      
   //A private constructor
   // used internally to create the singleton instance.
   // This prevents other parts of the app from creating multiple instances.
      
   TLocalStorage._internal();

   //factory instance which will assign or create an new instance 
  factory TLocalStorage.instance(){
    
    _instance??=TLocalStorage._internal(); // in these way it will not crash if some how we landed with the null value
    
    //Checks if _instance is null.
    //If null, it initializes _instance using the private constructor.
    //Always returns the single instance (_instance).
    return _instance!;    
  }


   
  static Future<void> init(String buketName) async{
    await GetStorage.init(buketName); // these will first initialize storage with buket
    //private constructure will be initilaize only once
    _instance=TLocalStorage._internal();//form these private constructor we will call the _storage method 
    _instance!._storage=GetStorage(buketName); // once these init function isn called it will create the instance only one time 
  }                                            // and store the static instance because it is static we ca use it in through out
                                              // our application  
                                            
   
  
  
    // Generic method to save data
    T? readData<T>(String key) {
      return _storage.read<T>(key);
    }
  
    // Generic method to save data
    Future<void> saveData<T>( String key, T value) async{
       await _storage.write(key, value);
    }

    // Generic method to remove data
Future<void> removeData (String key) async {
  await _storage.remove(key);
}
// Clear all data in storage
Future<void> clearAll() async {
  await _storage.erase();
}
  }