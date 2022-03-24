import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var isNotFirstLaunch = UserDefaults.standard.bool(forKey: "firstLaunch")
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: WelcomeScreen())
        return true
    }
}

