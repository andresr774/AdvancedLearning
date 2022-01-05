//
//  CloudKitPushNotificationBootcamp.swift
//  AdvancedLearning
//
//  Created by Andres camilo Raigoza misas on 4/01/22.
//

import SwiftUI
import CloudKit

class CloudKitPushNotificationBootcampViewModel: ObservableObject {
    
    func requestNotificationsPermissions() {
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print(error)
            } else if success {
                print("Notification permissions success!")
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                print("Notification permissions failure.")
            }
        }
    }
    
    func subscribeToNotifications() {
        
        let predicate = NSPredicate(value: true) // look for data that matches the record type in the query subscription
        
        let subscription = CKQuerySubscription(recordType: "Fruits", predicate: predicate, subscriptionID: "fruit_added_to_database", options: .firesOnRecordCreation)
        
        let notification = CKSubscription.NotificationInfo()
        notification.title = "There's a new fruit"
        notification.alertBody = "Open the app to check your fruits."
        notification.soundName = "default"
        
        subscription.notificationInfo = notification
        
        CKContainer.default().publicCloudDatabase.save(subscription) { returnedSubscription, returnedError in
            if let returnedError = returnedError {
                print(returnedError)
            } else {
                print("Successfully subscribe to notifications")
            }
        }
    }
    
    func unsubscribeToNotifications() {
        //CKContainer.default().publicCloudDatabase.fetchAllSubscriptions(completionHandler: )
        CKContainer.default().publicCloudDatabase.delete(withSubscriptionID: "fruit_added_to_database") { returnedID, returnedError in
            if let returnedID = returnedID {
                print(returnedError)
            } else {
                print("Successfully unsubscribe")
            }
        }
    }
}

struct CloudKitPushNotificationBootcamp: View {
    
    @StateObject private var vm = CloudKitPushNotificationBootcampViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            
            Button("Request notification permissions") {
                vm.requestNotificationsPermissions()
            }
            
            Button("Subscribe to notification") {
                vm.subscribeToNotifications()
            }
            
            Button("Unsubscribe to notification") {
                vm.unsubscribeToNotifications()
            }
        }
    }
}

struct CloudKitPushNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitPushNotificationBootcamp()
    }
}
