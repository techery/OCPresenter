//
//  Presenter.h
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceInjector.h"

@protocol ServicesConsumer <NSObject>

@end

@interface Presenter<VIEW, SERVICES> : NSObject

@property (nonatomic, weak, readonly, nullable) VIEW view;
@property (nonatomic, readonly, nonnull) SERVICES services;

- (_Nonnull instancetype)initWithView:(_Nullable VIEW)view services:(_Nonnull SERVICES)services;

@end
