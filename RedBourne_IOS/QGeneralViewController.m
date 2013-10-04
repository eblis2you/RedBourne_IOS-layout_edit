//
//  QGeneralViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 4/10/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "QGeneralViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"


@interface QGeneralViewController ()

@property (nonatomic, strong) QBooleanElement *switchCtl;
@property (strong, nonatomic) UITextField *firstNameField, *surNameField, *registrationDate, *medicareNumberField, *DOBField;

@end

@implementation QGeneralViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"General Information";
    root.grouped = YES;
    QSection *section = [[QSection alloc] initWithTitle:@"Personal Infor"];
    
    QLabelElement *fnameLabel = [[QLabelElement alloc] initWithTitle:@"First Name" Value:nil];
    
    [root addSection:section];
    [section addElement:fnameLabel];
    
    UINavigationController *navigation = [QuickDialogController controllerWithNavigationForRoot:root];
    
    navigation.navigationBar.topItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(dismissModalViewController)];

    
    [self presentViewController:navigation animated:YES completion:nil];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
