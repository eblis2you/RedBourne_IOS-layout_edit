//
//  QGeneralViewController.h
//  RedBourne_IOS
//
//  Created by Jerry on 4/10/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildModel.h"

@interface QGeneralViewController : QuickDialogController

@property (strong, nonatomic) ChildModel *child;



- (void)saveName;
- (void)saveChildWhenClosing;


@end
