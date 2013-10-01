//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *medNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *medDosageTextField;
@property (weak, nonatomic) IBOutlet UITextField *medIntervalTextField;
@property (weak, nonatomic) IBOutlet UITextField *medStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *medEndDateTextField;

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
    
    self.medNameTextField.text = MedicationNeedEdit.name;
    self.medDosageTextField.text = MedicationNeedEdit.dosage;
    self.medIntervalTextField.text = MedicationNeedEdit.interval;
    self.medStartDateTextField.text = MedicationNeedEdit.strat;
    self.medEndDateTextField.text = MedicationNeedEdit.end;
    
    NSLog(@"%@",MedicationNeedEdit.description);

    
}




#pragma mark - IBAction for button


- (IBAction)saveButton:(UIButton *)sender {
    
    MedicationNeedEdit.name = self.medNameTextField.text;
    MedicationNeedEdit.dosage = self.medDosageTextField.text ;
    MedicationNeedEdit.interval = self.medIntervalTextField.text;
    MedicationNeedEdit.strat = self.medStartDateTextField.text;
    MedicationNeedEdit.end = self.medEndDateTextField.text ;
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
