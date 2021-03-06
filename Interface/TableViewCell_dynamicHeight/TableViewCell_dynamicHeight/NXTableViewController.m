//
//  NXTableViewController.m
//  TableViewCell_dynamicHeight
//
//  Created by CornerZhang on 14/11/5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewController.h"
#import "NXTableViewCell.h"

@interface NXTableViewController ()
@end

static NXTableViewController* only = nil;

@implementation NXTableViewController
@synthesize data;

+ (instancetype) sharedInstance {
    @synchronized(self) {
        if (only==nil) {
            only = [[NXTableViewController alloc] init];
        }
    }
    return only;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        only = self;
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"demoData" ofType:@"plist"];
        data = [[NSMutableArray alloc] initWithContentsOfFile:path];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary* cellData = [data objectAtIndex:indexPath.row];
    UILabel* mainLabel = [cell valueForKey:@"mainTitle"];
    UILabel* subLabel = [cell valueForKey:@"subTitle"];
    mainLabel.text = [cellData objectForKey:@"maintitle"];
    subLabel.text = [cellData objectForKey:@"subtitle"];
    
    [cell setValue:[NSNumber numberWithInteger:indexPath.row] forKey:@"index"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row: %d", indexPath.row);
    
    NSDictionary* cellData = [data objectAtIndex:indexPath.row];
    NSNumber* bigger = [cellData objectForKey:@"bigger"];
    return [bigger boolValue] ? 132 : 88;
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

@end
