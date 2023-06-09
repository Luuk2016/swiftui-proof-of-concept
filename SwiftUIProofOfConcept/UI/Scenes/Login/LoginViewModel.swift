//
//  LoginViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 25/04/2023.
//

import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""

    @Published private(set) var formIsValid: Bool = false

    private var publishers = Set<AnyCancellable>()

    // MARK: Methods
    init() {
        isLoginFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
    }
}

private extension LoginViewModel {
    // MARK: - Properties
    var isEmailValidPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { email in
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }

    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                return password.count >= 8
            }
            .eraseToAnyPublisher()
    }

    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isEmailValidPublisher, isPasswordValidPublisher)
            .map { isEmailValid, isPasswordValid in
                return isEmailValid && isPasswordValid
            }
            .eraseToAnyPublisher()
    }
}
