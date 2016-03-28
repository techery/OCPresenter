//
//  LoginViewController.m
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import "LoginViewController.h"



@interface LoginViewController ()

@property (nonatomic, strong) LoginPresenter *presenter;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation LoginViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        id<ServiceInjector> injector = nil;
        id<LoginServices> services = [injector createServices:@protocol(LoginServices)];
        self.presenter = [[LoginPresenter alloc] initWithView:self services:services];
    }
    return self;
}

- (id<LoginViewActions>)actions {
    return self.presenter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginButton.frame = CGRectMake(100, 100, 100, 100);
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    
    [self.loginButton addTarget:self.actions action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.loginButton];
}

- (void)showError:(NSString*)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error"
                                                                   message:error
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [self.actions onDismissError];
                                                          }];
    

    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)setRetryStatus:(BOOL)shouldRetry {
    if (shouldRetry) {
        [self.loginButton setTitle:@"Retry" forState:UIControlStateNormal];
    } else {
        [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    }
}

- (void)dismissAlert {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
