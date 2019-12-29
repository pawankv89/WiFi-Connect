//
//  ViewController.swift
//  WiFi Scanner
//
//  Created by Pawan kumar on 29/12/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit
import NetworkExtension

class ViewController: UIViewController {

     private let SSID = "iBall-Baton"
     private let passphrase = "Pks@1989"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectAction(_ sender: Any) {
        
        let hotspotConfig = NEHotspotConfiguration(ssid: SSID, passphrase: passphrase, isWEP: false)
        
        NEHotspotConfigurationManager.shared.apply(hotspotConfig) {[unowned self] (error) in
            
            if let error = error {
                self.showError(error: error)
                if error.localizedDescription == "already associated."
                               {
                                   print("Connected")
                               }
                               else{
                                   print("No Connected")
                               }
            } else {
                self.showSuccess()
                 print("Connected")
            }
        }
    }
    
    @IBAction func disconnectAction(_ sender: Any) {
        NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: SSID)
    }
    
    private func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "Darn", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func showSuccess() {
        let alert = UIAlertController(title: "", message: "Connected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Cool", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

