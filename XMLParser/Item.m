//
//  Item.m
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/12/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import "Item.h"

@implementation Item

- (id)initWithName: (NSString *)key
             value: (NSString *)value {
    
    self = [super init];
    if (self) {
        self.key = key;
        self.value = value;
    }
    return self;
}

@end
