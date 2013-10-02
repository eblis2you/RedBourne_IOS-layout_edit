//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *medNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *medDosageTextField;
@property (weak, nonatomic) IBOutlet UITextField *medIntervalTextField;
@property (weak, nonatomic) IBOutlet UITextField *medStartDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *medEndDateTextField;

@property (strong, nonatomic) IBOutlet UIPickerView *intervalTypePicker;
@property (strong, nonatomic) NSArray *intervalTypeArray;

@end




@implementation ChildInfoMedicationViewController
@synthesize MedicationNeedEdit;

#pragma mark - UIPickerView




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
    


    self.intervalTypeArray = [[NSArray alloc] initWithObjects:@"hourly",@"times", nil];

    [self.intervalTypePicker reloadAllComponents];
    
    
    if ([MedicationNeedEdit.interval isEqual: @"hourly"]) {
        [self.intervalTypePicker selectRow:0 inComponent:0 animated:NO];
    } else
        [self.intervalTypePicker selectRow:1 inComponent:0 animated:NO];
    
    


    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.intervalTypeArray count];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.intervalTypeArray objectAtIndex:row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"Chosen item: %@", [self.intervalTypeArray objectAtIndex:row]);
    MedicationNeedEdit.interval = [self.intervalTypeArray objectAtIndex:row];

}
#pragma mark - IBAction for button


- (IBAction)saveButton:(UIButton *)sender {
    
    MedicationNeedEdit.name = self.medNameTextField.text;
    MedicationNeedEdit.dosage = self.medDosageTextField.text ;
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
