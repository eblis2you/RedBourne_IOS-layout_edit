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

@property (strong, nonatomic) IBOutlet UIPickerView *intervalTypePicker;
@property (strong, nonatomic) NSArray *itemArray;

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
    
    self.itemArray = [[NSArray alloc] initWithObjects:@"Hourly",@"Times", nil];
    
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.itemArray count];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.itemArray objectAtIndex:row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"Chosen item: %@", [self.itemArray objectAtIndex:row]);
    
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
