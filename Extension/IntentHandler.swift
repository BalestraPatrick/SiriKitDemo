//
//  IntentHandler.swift
//  Extension
//
//  Created by Patrick Balestra on 12/14/16.
//  Copyright © 2016 Patrick Balestra. All rights reserved.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any? {
        if intent is INSendPaymentIntent {
            return self
        }
        return nil
    }
}

// MARK: - INSendPaymentIntentHandling

extension IntentHandler: INSendPaymentIntentHandling {

    func handle(sendPayment intent: INSendPaymentIntent, completion: @escaping (INSendPaymentIntentResponse) -> Void) {
        // Check that we have valid values for payee and currencyAmount
        guard let payee = intent.payee, let amount = intent.currencyAmount else {
            return completion(INSendPaymentIntentResponse(code: .failure, userActivity: nil))
        }
        // Make your payment!
        print("Sending \(amount) payment to \(payee)!")
        completion(INSendPaymentIntentResponse(code: .success, userActivity: nil))
    }
}
