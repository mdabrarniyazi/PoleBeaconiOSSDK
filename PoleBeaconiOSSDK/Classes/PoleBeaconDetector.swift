//
//  PoleBeaconDetector.swift
//  Pods-PoleBeaconiOSSDK_Example
//
//  Created by Abrar Niyazi on 03/11/17.
//

import Foundation
import UIKit
import KontaktSDK

public class PoleBeaconDetector: UIViewController {
    
    var eddystoneManager: KTKEddystoneManager!
    public var eddystonesIDs = [KTKEddystoneUID]()
    override public func viewDidLoad() {
        super.viewDidLoad()
        print("ABRAR")
        Kontakt.setAPIKey("SqsMXrtfSNncgUTHgiAzRSbLlnNruZxN")
        eddystoneManager = KTKEddystoneManager(delegate: self)
        
    }
    
}

extension PoleBeaconDetector: KTKEddystoneManagerDelegate {
    // implement KTKEddystoneManagerDelegate protocol
    public func eddystoneManager(_ manager: KTKEddystoneManager, didDiscover eddystones: Set<KTKEddystone>, in region: KTKEddystoneRegion?) {
        
        
        for device in eddystones {
            if let uniqueId = device.eddystoneUID {
                print("Detected a beacon \(uniqueId)")
                eddystonesIDs.insert(uniqueId, at: 0)
            } else {
                print("Detected a beacon with an unknown Unique ID")
            }
        }
        
        
    }
}
