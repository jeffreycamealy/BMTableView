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
{
    BMTableView *tableView;
}
@end


@implementation TableViewVC

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    
}


#pragma mark - Private API

- (void)setupTableView {
    tableView = BMTableView.new;
    [self.view addSubview:tableView];
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    tableView.delegate = self;
    [tableView registerClass:ButtonCell.class forCellReuseIdentifier:nil];
    
    [tableView reloadData];
}

#pragma mark - Table View Delegate

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section {
        return 13;
}

- (BMTableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    
    cell.title = [BMMath randomStringOfLength:(arc4random()%300) + 200];
    cell.backgroundColor = randomColor();
    return cell;
}

@end
