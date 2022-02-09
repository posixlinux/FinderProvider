//
//  ViewController.swift
//  FinderProvider
//

import Cocoa
import FileProvider

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func tapAddDomain(_ sender: Any) {
        let name = self.randString(8)
        let identifier = NSFileProviderDomainIdentifier(UUID().uuidString)
        let domain = NSFileProviderDomain(identifier: identifier, displayName: name)
        NSFileProviderManager.add(domain) { error in
            print("Error: \(error as NSError?)")
        }
    }
    
    private func randString(_ length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0 ..< length).compactMap { _ in letters.randomElement() })
    }
}
