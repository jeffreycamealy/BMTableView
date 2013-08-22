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

- (void)layoutSubviews {
    [super layoutSubviews];
    
    label.backgroundColor = self.backgroundColor;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    label.text = title;
}

@end
