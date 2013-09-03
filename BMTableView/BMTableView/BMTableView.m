//
//  BMTableView.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMTableView.h"

@interface BMTableView () {
    UIScrollView *scrollView;
    NSMutableArray *reusuableCells;
    
    Class cellReuseClass;
}

@end

@implementation BMTableView

#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        [self setupScrollView];
        reusuableCells = [NSMutableArray new];
    }
    return self;
}


#pragma mark - Public API

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
    NSAssert([cellClass isSubclassOfClass:BMTableViewCell.class], @"Cells must subclass BMTableViewCell.");
    cellReuseClass = cellClass;
}

- (id)dequeueReusableCellWithIdentifier:(NSString *)identifier {
    NSAssert(cellReuseClass, @"The must be a cell class associated with this reuse identifier.");
    
    BMTableViewCell *cell = nil;
    
    if (reusuableCells.count < 5) {
        cell = [cellReuseClass new];
        [reusuableCells addObject:cell];
    } else {
        cell = reusuableCells[0];
        [cell removeConstraints:cell.constraints];
        [reusuableCells removeObjectAtIndex:0];
        [reusuableCells addObject:cell];
    }
    
    return cell;
}


#pragma mark - Private API

- (void)setupScrollView {
    scrollView = UIScrollView.new;
    [self addSubview:scrollView];
    [scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)reloadData {
    NSInteger numRows = [self.delegate numberOfRowsInSection:0];
    BMTableViewCell *previousCell = nil;
    for (int i = 0; i < numRows; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        BMTableViewCell *cell = [self.delegate cellForRowAtIndexPath:indexPath];
        [scrollView addSubview:cell];
        
        if(previousCell) {
            [cell makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(previousCell.bottom).with.offset(self.cellSpacing);
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
        
        if (i == numRows-1) {
            [scrollView makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(cell.bottom);
            }];
        }
    }
}

@end

































