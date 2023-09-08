//
//  ViewController.swift
//  Example
//
//  Created by Hossam Youssof on 09/09/2023.
//

import NFCTunnel
import UIKit

class ViewController: UIViewController, NFCTunnelDelegate {
    @IBOutlet var lblResponse: UILabel!

    var nfcTunnel: NFCTunnelSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        nfcTunnel = NFCTunnelSession(delegate: self)
    }

    @IBAction func startScan() {
        print("Start scan tag")
        lblResponse.text = "Start scan tag"

        startNFCScan()
    }

    func startNFCScan() {
        nfcTunnel?.startSession()
    }

    func onSuccess(data json: String) {
        lblResponse.text = json

        nfcTunnel?.updateSessionMessage(message: "NDEF record has been readed")
        nfcTunnel?.invalidateSession()
    }

    func onError(error: Error?) {
        let alertController = UIAlertController(
            title: "Session Invalidated",
            message: error?.localizedDescription,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)

        nfcTunnel?.invalidateSession()
    }

    deinit {
        nfcTunnel = nil
    }
}
