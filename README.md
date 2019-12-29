# WiFi-Connect


## WiFi-Connect with WiFi Connect with send wifi name and password.

Added Some screens here.

![](https://github.com/pawankv89/WiFi-Connect/blob/master/images/screen_1.PNG)
![](https://github.com/pawankv89/WiFi-Connect/blob/master/images/screen_2.PNG)
![](https://github.com/pawankv89/WiFi-Connect/blob/master/images/screen_3.PNG)
![](https://github.com/pawankv89/WiFi-Connect/blob/master/images/screen_4.PNG)

## Usage

#### Controller

``` swift 


import UIKit
import NetworkExtension

class ViewController: UIViewController {

     private let SSID = "iBall-Baton"
     private let passphrase = "P@1234567890"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func connectAction(_ sender: Any) {
        
        let hotspotConfig = NEHotspotConfiguration(ssid: SSID, passphrase: passphrase, isWEP: false)
        
        NEHotspotConfigurationManager.shared.apply(hotspotConfig) {[unowned self] (error) in
            
            if let error = error {
                self.showError(error: error)
            }
            else {
                self.showSuccess()
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



```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each this release can be found in the [CHANGELOG](CHANGELOG.mdown). 

