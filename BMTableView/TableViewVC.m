//
//  TableViewVC.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "TableViewVC.h"
#import "BMTableView.h"
#import "ButtonCell.h"


@interface TableViewVC () <BMTableViewDelegate>

@end

@implementation TableViewVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BMTableView *tableView = BMTableView.new;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    tableView.numberOfRowsInSection = ^NSUInteger{
        return 13;
    };
    
    [tableView reloadData];
}

#pragma mark - Table View Delegate

- (BMTableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ButtonCell *cell = ButtonCell.new;
    cell.title = [BMMath randomStringOfLength:(arc4random()%300) + 200];
    cell.backgroundColor = randomColor();
    return cell;
}

@end
