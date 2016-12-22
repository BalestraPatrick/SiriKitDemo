//
//  IntentViewController.swift
//  ExtensionUI
//
//  Created by Patrick Balestra on 12/14/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling, INUIHostedViewSiriProviding {
    
    @IBOutlet weak var contentLabel: UILabel!
    
    // MARK: - INUIHostedViewControlling

    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!) {

        if let paymentIntent = interaction.intent as? INSendPaymentIntent {
            // If any of this properties is not set, fallback to the default UI by hiding this view controller.
            guard let amount = paymentIntent.currencyAmount?.amount, let currency = paymentIntent.currencyAmount?.currencyCode, let name = paymentIntent.payee?.displayName else {
                return completion(CGSize.zero)
            }
            let paymentDescription = "\(amount)\(currency) to \(name)"
            contentLabel.text = paymentDescription
        }
        if let completion = completion {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }

    var displaysPaymentTransaction: Bool {
        return true
    }
}
