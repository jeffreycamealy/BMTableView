//
//  BMTableView.h
//  BMTableView
//
//  Created by Jeffrey Camealy on 8/16/13.
//  Copyright (c) 2013 bearMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMTableViewCell.h"

@protocol BMTableViewDelegate <NSObject>

- (BMTableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BMTableView : UIView

@property (strong) NSUInteger(^numberOfRowsInSection)();
@property (weak) id<BMTableViewDelegate> delegate;

- (void)reloadData;

@end
