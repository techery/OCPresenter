//
//  LoginPresenter.m
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import "LoginPresenter.h"
#import <objc/runtime.h>

@interface LoginPresenter () 

@property (nonatomic, strong) id<LoginServices> xServices;

@end

@implementation LoginPresenter

- (NSArray*)attributesOfProp:(NSString*)propName ofObj:(id)obj {
    
    objc_property_t prop = class_getProperty([obj class], propName.UTF8String);
    if (!prop) {
        // doesn't exist for object
        return nil;
    }
    const char * propAttr = property_getAttributes(prop);
    NSString *propString = [NSString stringWithUTF8String:propAttr];
    NSArray *attrArray = [propString componentsSeparatedByString:@","];
    return attrArray;
}

- (void)login {
    
    NSLog(@"xServices:%@", [self attributesOfProp:@"xServices" ofObj:self]);
    NSLog(@"services:%@", [self attributesOfProp:@"services" ofObj:self]);
    NSLog(@"view:%@", [self attributesOfProp:@"view" ofObj:self]);
    
    [self.view showError:@"Login failed"];
}

- (void)skip {
    
}

- (void)setUsername:(NSString*)username {
    
}

- (void)setPassword:(NSString*)username {
    
}

- (void)setTerms:(NSString*)username {
    
}

- (void)onDismissError {
    [self.view setRetryStatus:YES];
}

@end
