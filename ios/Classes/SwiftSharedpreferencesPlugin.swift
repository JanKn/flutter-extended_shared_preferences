import Flutter
import UIKit

public class SwiftSharedpreferencesPlugin: NSObject, FlutterPlugin {
    
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.marlokessler.sharedpreferences", binaryMessenger: registrar.messenger())
        let instance = SwiftSharedpreferencesPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        
        guard let arguments = call.arguments as? Dictionary<String, Any>
              else {
                result(FlutterError())
                return
        }
        let defaults = UserDefaults.standard
      

        switch method {
            
        case "getAll":
            let dicitionary = defaults.dictionaryRepresentation().filter {
                $0.value is NSString || $0.value is NSNumber
            }
            result(dicitionary)
            
        case "setBool":
            defaults.set(arguments["value"], forKey: arguments["key"] as! String)
            result(true)
            
        case "setInt":
            defaults.set(arguments["value"], forKey: arguments["key"] as! String)
            result(true)
            
        case "setDouble":
            defaults.set(arguments["value"], forKey: arguments["key"] as! String)
            result(true)
            
        case "setString":
            defaults.set(arguments["value"], forKey: arguments["key"] as! String)
            result(true)
            
        case "setStringList":
            defaults.set(arguments["value"], forKey: arguments["key"] as! String)
            result(true)
            
        case "remove":
            defaults.removeObject(forKey: arguments["key"] as! String)
            result(true)
            
        case "clear":
            //defaults.removePersistentDomain(forName: filename)
            result(true)
            
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
