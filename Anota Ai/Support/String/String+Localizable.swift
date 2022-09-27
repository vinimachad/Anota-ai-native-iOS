//
//  String+Localizable.swift
//  Anota Ai
//
//  Created by Vinicius Galhardo Machado on 05/08/22.
//

import Foundation

enum LocalizableFiles: String {
    case `default` = "Default"
    case error = "Error"
    case onboarding = "Onboarding"
    case findYourLocation = "FindYourLocation"
    case confirmLocation = "ConfirmLocation"
    case createAccount = "CreateAccount"
    case login = "Login"
}

extension String {
    
    private func localized(context: LocalizableFiles) -> String {
        return NSLocalizedString(self, tableName: context.rawValue, value: "", comment: "")
    }
    
    private func localizedWithArgs(context: LocalizableFiles, _ args: [CVarArg]) -> String {
        return String(format: localized(context: context), arguments: args)
    }
    
    func localize(_ context: LocalizableFiles, _ args: [CVarArg] = []) -> String {
        guard !args.isEmpty else {
            return localized(context: context)
        }
        
        return localizedWithArgs(context: context, args)
    }
}
