//
//  SignUpViewModel.swift
//  SwiftUIProofOfConcept
//
//  Created by Luuk Kenselaar on 25/04/2023.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    // MARK: - Properties
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var termsAndConditions: Bool = false

    @Published private(set) var formIsValid: Bool = false

    private var publishers = Set<AnyCancellable>()

    init() {
        isSignUpFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.formIsValid, on: self)
            .store(in: &publishers)
    }
}

private extension SignUpViewModel {
    var isFullNameValidPublisher: AnyPublisher<Bool, Never> {
        $fullName
            .map { name in
                return name.count >= 3
            }
            .eraseToAnyPublisher()
    }

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

    var confirmedTermsAndConditionsPublisher: AnyPublisher<Bool, Never> {
        $termsAndConditions
            .map { termsAndConditions in
                return termsAndConditions
            }
            .eraseToAnyPublisher()
    }

    var isSignUpFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest4(
            isFullNameValidPublisher,
            isEmailValidPublisher,
            isPasswordValidPublisher,
            confirmedTermsAndConditionsPublisher)
        .map { isFullNameValid, isEmailValid, isPasswordValid, confirmedTermsAndConditions in
            return isFullNameValid && isEmailValid && isPasswordValid && confirmedTermsAndConditions
        }
        .eraseToAnyPublisher()
    }
}
