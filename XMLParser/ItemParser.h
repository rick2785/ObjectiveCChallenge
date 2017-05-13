//
//  ItemParser.h
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/11/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemParser : NSObject <NSXMLParserDelegate>

@property NSMutableArray *itemArray;

- (id)initWithArray: (NSMutableArray *)itemArray;

- (void)parseXMLFile;

@end
