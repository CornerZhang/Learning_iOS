//
//  TableViewController.h
//  TableViewWithSearchBar
//
//  Created by CornerZhang on 14/11/18.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchViewController;

@interface TableViewController : UITableViewController <UISearchBarDelegate, UISearchControllerDelegate>
@property (strong, nonatomic) NSArray* tableData;
@property (strong, nonatomic) NSMutableArray* filteredTableData;
@property (strong, nonatomic) SearchViewController *searchController;

@end
