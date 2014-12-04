//
//  TableViewController.m
//  TableViewWithSearchBar
//
//  Created by CornerZhang on 14/11/18.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "TableViewController.h"
#import "SearchViewController.h"

#define DEBUG 1

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize tableData;
@synthesize filteredTableData;
@synthesize searchController;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        tableData = [[NSArray alloc] init];
        filteredTableData = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    searchController = [[SearchViewController alloc] initWithSearchResultsController:self];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
}

- (void)willDismissSearchController:(UISearchController *)searchController {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
    [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
#if DEBUG
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
#endif
}

@end
