import SwiftUI
import IOSSecuritySuite

struct DetailCheck: View {
    @State private var currentStatus = ""
    @State private var showToast = false
    @State private var toastMessage = ""
    let scrum: DailyScrum
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    checkStatus()
                }) {
                    Text("App Security Status")
                        .font(.largeTitle)
                        .padding()
                }
                Text(currentStatus)
                    .padding()
                    .font(.headline)
                Spacer()
            }
            
            // Overlay per il toast
            if showToast {
                VStack {
                    Spacer()
                    Text(toastMessage)
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 50)
                        .transition(.opacity)
                }
            }
        }
        .animation(.easeInOut, value: showToast)
    }
    
    func checkStatus() {
        /*
         github.com/securing/IOSSecuritySuite/blob/master/IOSSecuritySuite/JailbreakChecker.swift
         Performs:
            - URL Schemes
            - Suspicious files like frida-server, cydia, substrate, etc
            - Try to run unc0ver, cydia, apt
            - Check writable folder like /root/ , /private/
        */
        
        if IOSSecuritySuite.amIJailbroken() {
            currentStatus += "Jailbreak: TRUE\n"
        } else {
            currentStatus += "Jailbreak: FALSE\n"
        }
        
        let jailbreakStatus = IOSSecuritySuite.amIJailbrokenWithFailMessage()
        if jailbreakStatus.jailbroken {
            print("This device is jailbroken")
            let message = "Because: \(jailbreakStatus.failMessage)"
            print(message)
            
            // Visualizza il toast per 5 secondi
            toastMessage = message
            showToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    showToast = false
                }
            }
        } else {
            print("This device is not jailbroken")
        }
        
        if IOSSecuritySuite.amIRunInEmulator() {
            currentStatus += "Emulator: TRUE\n"
        } else {
            currentStatus += "Emulator: FALSE\n"
        }
        
        if IOSSecuritySuite.amIProxied() {
            currentStatus += "Proxy attached: TRUE\n"
        } else {
            currentStatus += "Proxy attached: FALSE\n"
        }
        
        if IOSSecuritySuite.amIReverseEngineered() {
            currentStatus += "Reverse Engineering: TRUE\n"
        } else {
            currentStatus += "Reverse Engineering: FALSE\n"
        }
        
        if IOSSecuritySuite.amIDebugged() {
            currentStatus += "Debugger: TRUE\n"
        } else {
            currentStatus += "Debugger: FALSE\n"
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCheck(scrum: DailyScrum.sampleData[0])
    }
}
