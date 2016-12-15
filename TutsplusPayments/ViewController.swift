//
//  ViewController.swift
//  SiriKit
//
//  Created by Patrick Balestra on 12/14/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        INPreferences.requestSiriAuthorization { authorizationStatus in
            switch authorizationStatus {
            case .authorized:
                break
            default:
                break
            }
        }
    }
}
