//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *medicationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *medicationDosageLabel;
@property (weak, nonatomic) IBOutlet UILabel *medicationIntervalLabel;
@property (weak, nonatomic) IBOutlet UILabel *medicationStartDate;
@property (weak, nonatomic) IBOutlet UILabel *medicationEndDate;

@end

@implementation ChildInfoMedicationViewController
@synthesize MedicationNeedEdit;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.medicationNameLabel.text = MedicationNeedEdit.name;
    
    
}




#pragma mark - IBAction for button


- (IBAction)saveButton:(UIButton *)sender {
    
    
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - System reserved
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
