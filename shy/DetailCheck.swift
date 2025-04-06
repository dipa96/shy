import SwiftUI
import IOSSecuritySuite
import Toast

struct DetailCheck: View {
    @State private var currentStatus = ""
    @State private var showToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    checkStatus()
                }) {
                    Text("App Security Status")
                        .font(.largeTitle)
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
        // Verifica Jailbreak
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
            
            // Mostra il toast per 5 secondi
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
        
        // Verifica se in emulator
        if IOSSecuritySuite.amIRunInEmulator() {
            currentStatus += "Emulator: TRUE\n"
        } else {
            currentStatus += "Emulator: FALSE\n"
        }
        
        // Verifica proxy
        if IOSSecuritySuite.amIProxied() {
            currentStatus += "Proxy attached: TRUE\n"
        } else {
            currentStatus += "Proxy attached: FALSE\n"
        }
        
        // Verifica reverse engineering
        if IOSSecuritySuite.amIReverseEngineered() {
            currentStatus += "Reverse Engineering: TRUE\n"
        } else {
            currentStatus += "Reverse Engineering: FALSE\n"
        }
        
        // Verifica debugger
        if IOSSecuritySuite.amIDebugged() {
            currentStatus += "Debugger: TRUE\n"
        } else {
            currentStatus += "Debugger: FALSE\n"
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCheck()
    }
}
