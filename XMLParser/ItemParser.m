//
//  FoodParser.m
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/11/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import "ItemParser.h"
#import "Item.h"

@interface ItemParser ()

@property NSXMLParser *parser;
@property NSString *element;

// Item properties
@property NSString *currentKey;
@property NSString *currentValue;

@end

@implementation ItemParser

- (id)initWithArray:(NSMutableArray *)itemArray {
    self = [super init];
    if (self) {
        self.itemArray = itemArray;
    }
    return self;
}

- (void)parseXMLFile {
    NSURL *xmlPath = [[NSURL alloc] initWithString:@"https://glacial-sands-39825.herokuapp.com/downloads/50f4a3d8eb0c450eaa500fa4c92312db"];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
}

-(void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
    if ([self.element isEqualToString:@"key"]) {
        self.currentKey = string;
    }
    else if ([self.element isEqualToString:@"value"]) {
        self.currentValue = string;
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        Item *thisItem = [[Item alloc] initWithName:self.currentKey
                                              value:self.currentValue];
        [self.itemArray addObject:thisItem];
    }
    self.element = nil;
}

@end
