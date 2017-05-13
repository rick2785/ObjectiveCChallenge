//
//  DetailViewController.h
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/12/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Item *itemItem;

- (void)setDetailItem:(id)newDetailItem;
@end
