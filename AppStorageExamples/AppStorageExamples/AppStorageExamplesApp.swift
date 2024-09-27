//
//  AppStorageExamplesApp.swift
//  AppStorageExamples
//
//  Created by Apple on 14/03/24.
//

import SwiftUI

@main
struct AppStorageExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

enum Keys : String{
    case isUserLogin = "isLoggedIn"
    
}


struct ContentView: View {
    
    // Using @AppStorage to store isLoggedIn state in UserDefaults
    @AppStorage(Keys.isUserLogin.rawValue) private var isLoggedIn = false

    var body: some View {
        Group {
            if isLoggedIn {
                TabBarView()
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct TabBarView: View {
    var body: some View {
        TabView {
            // Add your tabs here
            Text("Tab 1")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Tab 1")
                }
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Tab 2")
                }
        }
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    // Add your login logic here
    
    var body: some View {
        // Your login UI here, with appropriate fields and buttons
        Button(action: {
            // Simulate login process, set isLoggedIn to true
            isLoggedIn = true
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }) {
            Text("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
