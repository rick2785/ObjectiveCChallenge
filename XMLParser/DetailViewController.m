//
//  DetailViewController.m
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/12/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@property (weak, nonatomic) IBOutlet UILabel *keyLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@end

@implementation DetailViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (self.itemItem != newDetailItem) {
        self.itemItem = newDetailItem;
        
        // Update the view
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.itemItem) {
        self.keyLabel.text = self.itemItem.key;
        self.valueLabel.text = self.itemItem.value;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

@end
