//
//  NXDemoTableViewController.m
//  TableView_advanced
//
//  Created by CornerZhang on 14-10-2.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXDemoTableViewController.h"
#import "KCContactGroup.h"

#define kSearchbarHeight 44

@interface NXDemoTableViewController () <UISearchBarDelegate> {
    UISearchBar* _searchBar;
    NSMutableArray* _searchContacts;//符合条件的搜索联系人
    BOOL		_isSearching;
    
	NSMutableArray* _contacts;
    NSIndexPath* _selectedIndexPath;
}
@end

@implementation NXDemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _isSearching = NO;
    
    [self initData];
    [self addSearchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData {
    _contacts = [[NSMutableArray alloc] init];
    
    KCContact* contact1 = [KCContact initWithFirstName:@"Cui" andLastName:@"Kenshin" andPhoneNumber:@"18522322332"];
    KCContact* contact2 = [KCContact initWithFirstName:@"Cui" andLastName:@"Tom" andPhoneNumber:@"18538383331"];
    KCContactGroup* group1 = [KCContactGroup initWithName:@"C" andDetail:@"With names beginning with C" andContacts:[NSMutableArray arrayWithObjects:contact1, contact2, nil]];
    [_contacts addObject:group1];
    
    
    
	KCContact *contact3=[KCContact initWithFirstName:@"Lee" andLastName:@"Terry" andPhoneNumber:@"18500131238"];
	KCContact *contact4=[KCContact initWithFirstName:@"Lee" andLastName:@"Jack" andPhoneNumber:@"18500131239"];
	KCContact *contact5=[KCContact initWithFirstName:@"Lee" andLastName:@"Rose" andPhoneNumber:@"18500131240"];
	KCContactGroup *group2=[KCContactGroup initWithName:@"L" andDetail:@"With names beginning with L" andContacts:[NSMutableArray arrayWithObjects:contact3,contact4,contact5, nil]];
	[_contacts addObject:group2];

	KCContact *contact6=[KCContact initWithFirstName:@"Sun" andLastName:@"Kaoru" andPhoneNumber:@"18500131235"];
	KCContact *contact7=[KCContact initWithFirstName:@"Sun" andLastName:@"Rosa" andPhoneNumber:@"18500131236"];

	KCContactGroup *group3=[KCContactGroup initWithName:@"S" andDetail:@"With names beginning with S" andContacts:[NSMutableArray arrayWithObjects:contact6,contact7, nil]];
	[_contacts addObject:group3];

	KCContact *contact8=[KCContact initWithFirstName:@"Wang" andLastName:@"Stephone" andPhoneNumber:@"18500131241"];
	KCContact *contact9=[KCContact initWithFirstName:@"Wang" andLastName:@"Lucy" andPhoneNumber:@"18500131242"];
	KCContact *contact10=[KCContact initWithFirstName:@"Wang" andLastName:@"Lily" andPhoneNumber:@"18500131243"];
	KCContact *contact11=[KCContact initWithFirstName:@"Wang" andLastName:@"Emily" andPhoneNumber:@"18500131244"];
	KCContact *contact12=[KCContact initWithFirstName:@"Wang" andLastName:@"Andy" andPhoneNumber:@"18500131245"];
	KCContactGroup *group4=[KCContactGroup initWithName:@"W" andDetail:@"With names beginning with W" andContacts:[NSMutableArray arrayWithObjects:contact8,contact9,contact10,contact11,contact12, nil]];
	[_contacts addObject:group4];

	KCContact *contact13=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joy" andPhoneNumber:@"18500131246"];
	KCContact *contact14=[KCContact initWithFirstName:@"Zhang" andLastName:@"Vivan" andPhoneNumber:@"18500131247"];
	KCContact *contact15=[KCContact initWithFirstName:@"Zhang" andLastName:@"Joyse" andPhoneNumber:@"18500131248"];
	KCContactGroup *group5=[KCContactGroup initWithName:@"Z" andDetail:@"With names beginning with Z" andContacts:[NSMutableArray arrayWithObjects:contact13,contact14,contact15, nil]];
	[_contacts addObject:group5];

}

-(void)addSearchBar {
    CGRect searchBarRect = CGRectMake(0, 0, self.view.frame.size.width, kSearchbarHeight);
    _searchBar = [[UISearchBar alloc] initWithFrame:searchBarRect];
    _searchBar.placeholder = @"Please input keyword...";
    
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    self.tableView.tableHeaderView = _searchBar;
}

- (void)searchDataWithKeyword:(NSString*)keyword {
    _isSearching = YES;
    _searchContacts = [NSMutableArray array];
    
    [_contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop)
    	{
            KCContactGroup* group = obj;
            [group.contacts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop)
            	{
                    KCContact* contact = obj;
                    if ([contact.firstName.uppercaseString containsString:keyword.uppercaseString]
                        || [contact.lastName.uppercaseString containsString:keyword.uppercaseString]
                        || [contact.phoneNumber containsString:keyword]) {
                        [_searchContacts addObject:contact];
                    }
                }
             ];
    	}
     ];
    
    [self.tableView reloadData];
}

#pragma mark - search bar delegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    _isSearching = NO;
    _searchBar.text = @"";
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText {
    if ([_searchBar.text isEqual:@""]) {
        _isSearching = NO;
        [self.tableView reloadData];
        return;
    }
    
    [self searchDataWithKeyword:_searchBar.text];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self searchDataWithKeyword:_searchBar.text];
    [_searchBar resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_isSearching) {
        return 1;
    }
    return _contacts.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isSearching) {
        return _searchContacts.count;
    }
    KCContactGroup* group = _contacts[section];
    return group.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KCContact *contact = nil;
    
    if (_isSearching) {
        contact = _searchContacts[indexPath.row];
    }else{
	    KCContactGroup *group = _contacts[indexPath.section];
		contact = group.contacts[indexPath.row];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"ContactCell"];
    }
	cell.textLabel.text = [contact getName];
    cell.detailTextLabel.text = contact.phoneNumber;
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    KCContactGroup* group = _contacts[section];
    return group.name;
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    KCContactGroup* group = _contacts[section];
    return group.detail;
}

- (NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray* indexs = [[NSMutableArray alloc] init];
    for (KCContactGroup* group in _contacts) {
        [indexs addObject:group.name];
    }
    return indexs;
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

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 50;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;

    KCContactGroup* group = _contacts[indexPath.section];
    KCContact* contact = group.contacts[indexPath.row];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"System Info"
                                                    message:[contact getName]
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField* textField = [alert textFieldAtIndex:0];
    textField.text = contact.phoneNumber;
    [alert show];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	//当点击了第二个按钮（OK）
	if (buttonIndex==1) {
		UITextField *textField = [alertView textFieldAtIndex:0];
		//修改模型数据
		KCContactGroup *group = _contacts[_selectedIndexPath.section];
		KCContact *contact = group.contacts[_selectedIndexPath.row];
		contact.phoneNumber = textField.text;
		//刷新表格
		NSArray *indexPaths = @[_selectedIndexPath];
        [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
	}
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
