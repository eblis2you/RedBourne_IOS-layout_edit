//
//  RightViewController.h
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChildModel;
#import "ChildSelectionDelegate.h"

@interface RightViewController : UIViewController
    <UISplitViewControllerDelegate, ChildSelectionDelegate>

@property (nonatomic, strong) UIPopoverController *popover;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, strong) IBOutlet UIImageView *iconImageView;
@property (nonatomic, weak) IBOutlet UINavigationItem *navBarItem;

@property (weak, nonatomic) IBOutlet UILabel *childLabel1;
@property (weak, nonatomic) IBOutlet UILabel *childLabel2;
@property (weak, nonatomic) IBOutlet UILabel *childLabel3;
@property (weak, nonatomic) IBOutlet UILabel *childLabel4;

@property (weak, nonatomic) IBOutlet UILabel *childLabel5;
@property (weak, nonatomic) IBOutlet UILabel *childLabel6;
@property (weak, nonatomic) IBOutlet UILabel *childLabel7;
@property (weak, nonatomic) IBOutlet UILabel *childLabel8;

@property (nonatomic, strong) ChildModel *child;

@property (nonatomic, strong) UISegmentedControl *segmentedControl;


@end
	