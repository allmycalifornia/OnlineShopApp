import SwiftUI
import Firebase
import FirebaseMessaging
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // Устанавливаем делегата центра уведомлений
        UNUserNotificationCenter.current().delegate = self
        
        // Запрашиваем разрешения для уведомлений
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("Error requesting notifications authorization: \(error)")
            } else {
                print("Notifications permission granted: \(granted)")
            }
        }
        
        // Регистрация для удалённых уведомлений
        DispatchQueue.main.async {
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        // Первоначальный сброс badge
        resetBadgeCount()
        
        Messaging.messaging().delegate = self
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Сбрасываем badge при возвращении приложения в активное состояние
        resetBadgeCount()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Сбрасываем badge при переходе приложения из фонового режима
        resetBadgeCount()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Передаём APNs токен в Firebase
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token: \(fcmToken ?? "No Token")")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                 willPresent notification: UNNotification,
                                 withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Сбрасываем badge при получении уведомления
        resetBadgeCount()
        
        // Отображаем уведомление в приложении
        completionHandler([.banner, .sound, .badge])
    }
    
    // Сбрасываем badge через UNUserNotificationCenter
    private func resetBadgeCount() {
        UNUserNotificationCenter.current().setBadgeCount(0) { error in
            if let error = error {
                print("Failed to reset badge count: \(error)")
            } else {
                print("Badge count reset successfully")
            }
        }
    }
}

@main
struct OnlineShopAppApp: App {
    
    // MARK: - Properties
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vm = ViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
