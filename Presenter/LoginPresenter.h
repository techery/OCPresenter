//
//  LoginPresenter.h
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import "Presenter.h"

#define BEGIN_PRESENTER

#define ACTIONS(name) \
@protocol name##ViewActions <NSObject> \

#define VIEW(name) \
@end\
@protocol name##View <NSObject> \
@property (nonatomic, readonly, nonnull) id<name##ViewActions> actions; \

#define SERVICES(name) \
@end\
@protocol name##Services <NSObject> \

#define DEFINE_PRESENTER(name) \
@end\
@interface name##Presenter : Presenter <id<name##View>, id<name##Services>> <name##ViewActions> \
@end

//BEGIN_PRESENTER
//
//ACTIONS(Login)
//
//- (void)setUsername:(nonnull NSString*)username;
//- (void)setPassword:(nonnull NSString*)username;
//- (void)setTerms:(nonnull NSString*)username;
//
//- (void)login;
//- (void)skip;
//
//- (void)onDismissError;
//
//VIEW(Login)
//
//- (void)showError:(nonnull NSString*)error;
//- (void)dismissAlert;
//
//SERVICES(Login)
//
//@property (nonatomic, readonly, nonnull) NSFileManager *fileManager;
//
//DEFINE_PRESENTER(Login)

@protocol LoginViewActions <NSObject>

- (void)setUsername:(nonnull NSString*)username;
- (void)setPassword:(nonnull NSString*)username;
- (void)setTerms:(nonnull NSString*)username;

- (void)login;
- (void)skip;

- (void)onDismissError;

@end

@protocol LoginView <NSObject>

@property (nonatomic, readonly, nonnull) id<LoginViewActions> actions;

- (void)showError:(nonnull NSString*)error;
- (void)setRetryStatus:(BOOL)shouldRetry;
- (void)dismissAlert;

@end

@protocol LoginServices <NSObject>

@property (nonatomic, readonly, nonnull) NSFileManager *fileManager;

@end

@interface LoginPresenter : Presenter <id<LoginView>, id<LoginServices>> <LoginViewActions>

@end


