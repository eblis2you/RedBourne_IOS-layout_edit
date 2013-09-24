//
//  ChildInfoDisabilityViewController.h
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildModel.h"


@interface ChildInfoMedicationViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) ChildModel *child;


@property (strong,  nonatomic) UITableView *tableView;
@property (strong,  nonatomic) NSMutableArray *medicationList;




@end

