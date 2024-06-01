//
//  BuyViewController.swift
//  Doughnut
//
//  Created by 황유빈 on 5/2/24.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)

    }
    

    

}
