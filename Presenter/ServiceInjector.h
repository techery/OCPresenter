//
//  ServiceInjector.h
//  Presenter
//
//  Created by Sergey Zenchenko on 3/27/16.
//  Copyright © 2016 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceInjector <NSObject>

- (id)createServices:(Protocol*)protocol;

@end
