//
//  BMTableView.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "BMTableView.h"

@implementation BMTableView

#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        self.backgroundColor = UIColor.grayColor;
        self.contentSize = CGSizeMake(320, 1000);
        
        UIView *redView = UIView.new;
        redView.backgroundColor = UIColor.redColor;
        [self addSubview:redView];
        [redView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top);
            make.right.equalTo(self.right);
            make.left.equalTo(self.left);
            make.height.equalTo(@100);
        }];
        
        UIView *blueView = UIView.new;
        blueView.backgroundColor = UIColor.blueColor;
        [self addSubview:blueView];
        [blueView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(redView.bottom);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.height.equalTo(@80);
        }];
    }
    return self;
}


#pragma mark - AutoLayout

//- (void)updateConstraints {
//    [super updateConstraints];
//}

@end
