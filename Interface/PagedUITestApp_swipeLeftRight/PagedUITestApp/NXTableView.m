//
//  NXTableView.m
//  PagedUITestApp
//
//  Created by CornerZhang on 14-10-5.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

#import "NXTableView.h"
#import "NXTableViewCell.h"

@implementation NXTableView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NXTableViewCell* newCell = nil;
    newCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    newCell.title.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    newCell.foregroundCenter = newCell.contentView.center;
    
    return newCell;
}

@end
