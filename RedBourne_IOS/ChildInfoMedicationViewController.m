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


@property (weak, nonatomic) IBOutlet UITextField *medicationNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *medicationDosageTextField;
@property (weak, nonatomic) IBOutlet UITextField *medicationIntervalTextField;
@property (weak, nonatomic) IBOutlet UITextField *medicationStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *medicationEndDateTextField;

@end

@implementation ChildInfoMedicationViewController
@synthesize MedicationNeedEdit;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Edit Medication Information";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.medicationNameTextField.text = self.MedicationNeedEdit.name;
    self.medicationDosageTextField.text = self.MedicationNeedEdit.dosage;
    self.medicationIntervalTextField.text = self.MedicationNeedEdit.interval;
    self.medicationStartDateTextField.text = self.MedicationNeedEdit.strat;
    self.medicationEndDateTextField.text = self.MedicationNeedEdit.end;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}




#pragma mark - IBAction for button

- (IBAction)saveButton:(UIButton *)sender {
    self.MedicationNeedEdit.name = self.medicationNameTextField.text;
    self.MedicationNeedEdit.dosage = self.medicationDosageTextField.text;
    self.MedicationNeedEdit.interval = self.medicationIntervalTextField.text;
    self.MedicationNeedEdit.strat = self.medicationStartDate.text;
    self.MedicationNeedEdit.end = self.medicationEndDate.text;
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
