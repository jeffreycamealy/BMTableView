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
    UIView *contentView;
    
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
        
        contentView = [UIView new];
        [scrollView addSubview:contentView];
        [contentView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
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
        [contentView addSubview:cell];
        
        if(previousCell) {
            [cell makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(previousCell.bottom);
            }];
        } else {
            [cell makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(contentView.top);
            }];
        }
        
        [cell makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(contentView.left);
            make.right.equalTo(contentView.right);
        }];
        
        previousCell = cell;
        
//        
//        if (i == 0) {
//            [contentView makeConstraints:^(MASConstraintMaker *make) {
//               make.top.equal
//            }];
//        }
    }
}

@end

































