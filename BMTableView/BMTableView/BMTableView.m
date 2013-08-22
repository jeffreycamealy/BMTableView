//
//  BMTableView.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMTableView.h"

@interface BMTableView () {
    UIView *redView;
    UIView *blueView;
//    UIView *contentView;
    
    UIScrollView *scrollView;
}

@end

@implementation BMTableView

#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        scrollView = UIScrollView.new;
        [self addSubview:scrollView];
        [scrollView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)reloadData
{
    NSInteger numRows = self.numberOfRowsInSection();
    BMTableViewCell *previousCell = nil;
    for(int i=0;i<numRows;i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        BMTableViewCell *cell = [self.delegate cellForRowAtIndexPath:indexPath];
        [scrollView addSubview:cell];
        
        if(previousCell) {
            [cell makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(previousCell.bottom);
            }];
        } else {
            [cell makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(scrollView.top);
            }];
        }
        
        [cell makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(scrollView.left);
            make.right.equalTo(scrollView.right);
        }];
        
        previousCell = cell;
        
        if(i==numRows - 1) {
            [scrollView makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(cell.bottom);
            }];
        }
    }
}

@end

































