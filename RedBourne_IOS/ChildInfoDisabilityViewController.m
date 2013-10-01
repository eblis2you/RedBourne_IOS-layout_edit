//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoDisabilityViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ChildInfoDisabilityViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *disabilitySwitch;
@property (weak, nonatomic) IBOutlet UITextField *disabilityStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextView *disabilityCommentTextView;

@property (weak, nonatomic) IBOutlet UISwitch *specialNeedSwitch;
@property (weak, nonatomic) IBOutlet UITextField *specialNeedStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextView *specialNeedsCommentTextView;

- (IBAction)saveButton:(UIButton *)sender;
	
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

- (void)viewWillAppear:(BOOL)animated
{    
    if ([self.child.disability isEqualToString:@"YES"]) // child is disable
    {
        [self.disabilitySwitch setOn:YES];
        self.disabilityStartDateTextField.text = self.child.disabilityStartDate;
        self.disabilityCommentTextView.text = self.child.disabilityComments;
    } else { //child is normal 
        [self.disabilitySwitch setOn:NO];
        [self disabilityTrigger];
    }
    
    if ([self.child.specialNeeds isEqualToString:@"YES"])
    {
        [self.specialNeedSwitch setOn:YES];
        self.specialNeedStartDateTextField.text = self.child.specialNeedsStartDate;
        self.specialNeedsCommentTextView.text = self.child.specialNeedsComments;
    } else { //child is normal
        [self.specialNeedSwitch setOn:NO];
        [self specialNeedsTrigger];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UISwitch appearance] setOnImage:[UIImage imageNamed:@"yesSwitch"]];
    [[UISwitch appearance] setOffImage:[UIImage imageNamed:@"noSwitch"]];
    
    [self.disabilitySwitch addTarget:self action:@selector(disabilityTrigger)
                    forControlEvents:UIControlEventValueChanged];
    [self.specialNeedSwitch addTarget:self action:@selector(specialNeedsTrigger)
                     forControlEvents:UIControlEventValueChanged];
    
    [self.disabilityCommentTextView.layer setBorderColor:[[[UIColor lightGrayColor] colorWithAlphaComponent:0.8] CGColor]];
    [self.disabilityCommentTextView.layer setBorderWidth:2.0];
    self.disabilityCommentTextView.layer.cornerRadius = 5;
    self.disabilityCommentTextView.clipsToBounds = YES;
    
    [self.specialNeedsCommentTextView.layer setBorderColor:[[[UIColor lightGrayColor] colorWithAlphaComponent:0.8] CGColor]];
    [self.specialNeedsCommentTextView.layer setBorderWidth:2.0];
    self.specialNeedsCommentTextView.layer.cornerRadius = 5;
    self.specialNeedsCommentTextView.clipsToBounds = YES;
    
                                                          
}


-(void)disabilityTrigger
{
    if (!self.disabilitySwitch.isOn)
    {
        self.disabilityStartDateTextField.enabled = NO;
        self.disabilityStartDateTextField.backgroundColor = [UIColor lightGrayColor];
        self.disabilityCommentTextView.editable = NO;
        self.disabilityCommentTextView.backgroundColor = [UIColor lightGrayColor];
    }
    else if (self.disabilitySwitch.isOn)
    {
        self.disabilityStartDateTextField.enabled = YES;
        self.disabilityStartDateTextField.backgroundColor = [UIColor clearColor];
        self.disabilityCommentTextView.editable = YES;
        self.disabilityCommentTextView.backgroundColor = [UIColor clearColor];
    }
}

-(void)specialNeedsTrigger
{
    if (!self.specialNeedSwitch.isOn)
    {
        self.specialNeedStartDateTextField.enabled = NO;
        self.specialNeedStartDateTextField.backgroundColor = [UIColor lightGrayColor];
        self.specialNeedsCommentTextView.editable = NO;
        self.specialNeedsCommentTextView.backgroundColor = [UIColor lightGrayColor];
    }
    else if (self.specialNeedSwitch.isOn)
    {
        self.specialNeedStartDateTextField.enabled = YES;
        self.specialNeedStartDateTextField.backgroundColor = [UIColor clearColor];
        self.specialNeedsCommentTextView.editable = YES;
        self.specialNeedsCommentTextView.backgroundColor = [UIColor clearColor];
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
- (IBAction)saveButton:(UIButton *)sender {
    
    if (self.disabilitySwitch == 0) //NOT Disable, nothing need to update/
    {
        self.child.disability = @"NO";
    }
    else //child is disable, need to updated. 
    {
        self.child.disability = @"YES";
        self.child.disabilityStartDate = self.disabilityStartDateTextField.text;
        self.child.disabilityComments = self.disabilityCommentTextView.text;
    }
    
    switch ([self.disabilitySwitch isOn]) {
        case 0: //NOT disable
            self.child.disability = @"NO";
            break;
        case 1: //Disable
            self.child.disability = @"YES";
        default:
            break;
    }

    if (self.specialNeedSwitch == 0)
    {
        self.child.specialNeeds = @"NO";
    }
        else
    {
        self.child.specialNeeds = @"YES";
        self.child.specialNeedsStartDate = self.specialNeedStartDateTextField.text;
        self.child.specialNeedsComments = self.specialNeedsCommentTextView.text;
    }
    
    switch ([self.specialNeedSwitch isOn]) {
        case 0:
            self.child.specialNeeds = @"NO";
            break;
        case 1:
            self.child.specialNeeds = @"YES";
        default:
            break;
    }
    
    [ChildModel saveChild:self.child];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveChildWhenClosing{
    [ChildModel saveChild:self.child];
}

@end
