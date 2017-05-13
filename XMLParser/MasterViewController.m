//
//  MasterViewController.m
//  XMLParser
//
//  Created by Rickey Hrabowskie on 5/12/17.
//  Copyright © 2017 Rickey Hrabowskie. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Item.h"
#import "ItemParser.h"

@interface MasterViewController ()
@property NSMutableArray *itemArray;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.itemArray = [[NSMutableArray alloc] init];
    
    ItemParser *itemParser = [[ItemParser alloc] initWithArray:self.itemArray];
    [itemParser parseXMLFile];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.itemArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Item *item = self.itemArray[indexPath.row];
    cell.textLabel.text = item.key;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", item.value];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.itemArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.itemArray[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
