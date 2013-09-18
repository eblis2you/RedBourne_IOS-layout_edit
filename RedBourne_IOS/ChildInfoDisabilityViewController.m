//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoDisabilityViewController.h"

@interface ChildInfoDisabilityViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *disabilitySwitch;
@property (weak, nonatomic) IBOutlet UITextField *disabilityStartDateTextField;

@end

@implementation ChildInfoDisabilityViewController

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
    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
    [self.disabilitySwitch addTarget:self action:@selector(switchAction) forControlEvents:UIControlEventValueChanged];



}



	- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
