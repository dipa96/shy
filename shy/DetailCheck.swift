//
//  DetailCheck.swift
//  shy
//
//  Created by Donato Di Pasquale on 31/05/23.
//

import SwiftUI
import IOSSecuritySuite

struct DetailCheck: View {
    @State private var CurrentStatus = ""
    // let scrum: DailyScrum
    // let defenseCheck: Steroids
    
    var body: some View {
        VStack {
            Button(action: {
                checkStatus()
            }) {
                Text("Application Security Status").font(.largeTitle)
            }
            Text(CurrentStatus)
                .padding().font(.headline)
            Spacer()

        }
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
            CurrentStatus += "Jailbreak: TRUE\n"
        } else {
            CurrentStatus += "Jailbreak: FALSE\n"
        }
        
        let jailbreakStatus = IOSSecuritySuite.amIJailbrokenWithFailMessage()
        if jailbreakStatus.jailbroken {
            print("This device is jailbroken")
            print("Because: \(jailbreakStatus.failMessage)")
        } else {
            print("This device is not jailbroken")
        }
        
        if IOSSecuritySuite.amIRunInEmulator() {
            CurrentStatus += "Emulator: TRUE\n"
        } else {
            CurrentStatus += "Emulator: FALSE\n"
        }
        
        if IOSSecuritySuite.amIProxied() {
            CurrentStatus += "Proxy attached: TRUE\n"
        } else {
            CurrentStatus += "Proxy attached: FALSE\n"
        }
        
        if IOSSecuritySuite.amIReverseEngineered() {
            CurrentStatus += "Reverse Engineering: TRUE\n"
        } else {
            CurrentStatus += "Reverse Engineering: FALSE\n"
        }
        
        if IOSSecuritySuite.amIDebugged() {
            CurrentStatus += "Debugger: TRUE\n"
        } else {
            CurrentStatus += "Debugger: FALSE\n"
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //DetailView(scrum: DailyScrum.sampleData[0], DefenseCheck: DefenseCheckHandler())
        //DetailCheck(scrum: DailyScrum.sampleData[0])
        DetailCheck()
    }
}

