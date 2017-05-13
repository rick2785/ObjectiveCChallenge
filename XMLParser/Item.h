//
//  Item.h
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/12/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property NSString *key;
@property NSString *value;

- (id)initWithName: (NSString *)key
             value: (NSString *)value;

@end
