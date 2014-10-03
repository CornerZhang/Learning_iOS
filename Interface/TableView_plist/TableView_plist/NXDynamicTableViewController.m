//
//  NXDynamicTableViewController.m
//  TableView_plist
//
//  Created by CornerZhang on 14-7-1.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXDynamicTableViewController.h"
#import "NXTableViewCell.h"

@interface NXDynamicTableViewController ()

@end

@implementation NXDynamicTableViewController

@synthesize data;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
	NSString * path = [[NSBundle mainBundle] pathForResource:@"TableView_TestData" ofType:@"plist"];
    data = [NSMutableArray arrayWithContentsOfFile:path];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
    
    NSMutableDictionary* cellData = [data objectAtIndex:indexPath.row];
    NSNumber* show = [cellData objectForKey:@"showDescription"];
    
	return [NXTableViewCell heightForCell:[show boolValue]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
    
    NXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.controller = self;
    cell.indexPath = indexPath;
    
    NSMutableDictionary* cellData = [data objectAtIndex:indexPath.row];
    [cell loadData:cellData];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
