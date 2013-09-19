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
@property (weak, nonatomic) IBOutlet UISwitch *specialNeedSwitch;
@property (weak, nonatomic) IBOutlet UITextField *disabilityStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *specialNeedStartDateTextField;

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
    
    
    [self.disabilitySwitch addTarget:self action:@selector(disabilityTrigger) forControlEvents:UIControlEventValueChanged];
    [self.specialNeedSwitch addTarget:self action:@selector(specialNeedsTrigger) forControlEvents:UIControlEventValueChanged];

    

}

-(void)disabilityTrigger
{
    if (!self.disabilitySwitch.isOn)
    {
        self.disabilityStartDateTextField.enabled = NO;
 //      self.disabilityStartDateTextField.borderStyle = UITextBorderStyleBezel;
        self.disabilityStartDateTextField.backgroundColor = [UIColor lightGrayColor];
        NSLog(@"disable");
    }
    else if (self.disabilitySwitch.isOn)
    {
        self.disabilityStartDateTextField.enabled = YES;
 //       self.disabilityStartDateTextField.borderStyle = UITextBorderStyleBezel;
        self.disabilityStartDateTextField.backgroundColor = [UIColor clearColor];
        NSLog(@"enable");
    }
}

-(void)specialNeedsTrigger
{
    if (!self.specialNeedSwitch.isOn)
    {
        self.specialNeedStartDateTextField.enabled = NO;
        self.specialNeedStartDateTextField.backgroundColor = [UIColor lightGrayColor];

        NSLog(@"disable");
    }
    else if (self.specialNeedSwitch.isOn)
    {
        self.specialNeedStartDateTextField.enabled = YES;
        self.specialNeedStartDateTextField.backgroundColor = [UIColor clearColor];

        NSLog(@"enable");
    }
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
