//
//  SignupPresenter.swift
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

import Foundation

protocol SignupViewActions {
    func signup()
}

protocol SignupView {
    var actions:SignupViewActions {get set}
    func setError(error:String) -> Void
}

protocol SignupServices {
    var fileManager:NSFileManager { get }
}

public class SwiftPresenter<VIEW, SERVICES> {
    var view:VIEW
    var services:SERVICES
    
    init(view:VIEW, services:SERVICES) {
        self.view = view
        self.services = services
    }
}

@objc
public class SignupPresenter : Presenter {
    func doSomething() -> Void {
        self.services
    }
}
