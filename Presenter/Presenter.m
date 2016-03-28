//
//  Presenter.m
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import "Presenter.h"

@interface Presenter ()

@property (nonatomic, weak) id view;
@property (nonatomic, strong) id services;

@end

@implementation Presenter

- (instancetype)initWithView:(id)view services:(id)services {
    self = [super init];
    if (self) {
        self.view = view;
        self.services = services;
    }
    
    return self;
}

@end
