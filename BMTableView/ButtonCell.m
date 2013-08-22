//
//  ButtonCell.m
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/22/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import "ButtonCell.h"

@interface ButtonCell () {
    UILabel *label;
}
@end


@implementation ButtonCell


#pragma mark - Init Method

- (id)init {
    if (self = [super init]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"Hit Me" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        label = UILabel.new;
        [self addSubview:label];
        label.numberOfLines = 0;
        label.preferredMaxLayoutWidth = 280;
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.top);
            make.left.equalTo(self.left);
        }];
        
        [self makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(label.bottom);
        }];
    }
    return self;
}

- (void)buttonTapped {
    if ([self.title isEqualToString:@"hats"]) {
        self.title = @"lakdsjflk fsalkjf slf slkf jsa dfaksjf alskjf lsad flkasj dflas dlfk aslkfjlksafj lkasdj flkajs dlfk asdlkf aslkdfj laksjflkasj dflkjdlf ";
    } else {
        self.title = @"hats";
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    label.backgroundColor = self.backgroundColor;
}

- (void)updateConstraints
{
    [super updateConstraints];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    label.text = title;
    [UIView animateWithDuration:1.0 animations:^{
        [self.superview layoutIfNeeded];
    }];
}

@end
