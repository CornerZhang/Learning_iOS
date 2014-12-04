//
//  NXTableViewController.m
//  TableView_twoKeySort
//
//  Created by CornerZhang on 14/10/31.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableViewController.h"

@interface NXTableViewController ()

@end

@implementation NXTableViewController
@synthesize sourceData;
@synthesize data;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"demoData" ofType:@"plist"];
        sourceData = [NSMutableArray arrayWithContentsOfFile:path];
        
        data = [sourceData sortedArrayUsingComparator:^(NSMutableDictionary* obj1, NSMutableDictionary* obj2)
         {
             NSNumber* b1 = [obj1 objectForKey:@"completed"];
             NSNumber* b2 = [obj2 objectForKey:@"completed"];

             
             NSComparisonResult result = [b1 compare: b2];
             if (result == NSOrderedSame) {
                 NSNumber* n1 = [obj1 objectForKey:@"order"];
                 NSNumber* n2 = [obj2 objectForKey:@"order"];

                 return [n1 compare:n2];
             }
             return result;
         }
         ];
        
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
    return [data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSMutableDictionary* cellData = [data objectAtIndex:indexPath.row];
    NSNumber* order = [cellData objectForKey:@"order"];
    NSNumber* boolean = [cellData objectForKey:@"completed"];
    NSString* name = [cellData objectForKey:@"name"];
    
    NSString* text = [NSString stringWithFormat:@"%@ %@ %@", order, boolean, name];
    cell.textLabel.text = text;
    
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

@end
