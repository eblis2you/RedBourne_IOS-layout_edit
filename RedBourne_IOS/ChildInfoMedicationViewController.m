//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController ()


@end

@implementation ChildInfoMedicationViewController



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

    
}


#pragma mark - Table view Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)medicationTableView
{
    return 1;
}


-(NSInteger)medicationTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)medicationTableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [medicationTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
    
}




-(void)fillDataHardCode
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    MedicationModel *medication1 = [[MedicationModel alloc] initWithName:@"Asthma1"
                                                                  dosage:@"2 puffs"
                                                                interval:@"Hourly"
                                                                   start:@"11/09/2013"
                                                                     end:@"23/09/2013"];
    MedicationModel *medication2 = [[MedicationModel alloc] initWithName:@"Asthma2"
                                                                  dosage:@"2 puffs"
                                                                interval:@"Hourly"
                                                                   start:@"11/09/2013"
                                                                     end:@"23/09/2013"];
    MedicationModel *medication3 = [[MedicationModel alloc] initWithName:@"Asthma3"
                                                                  dosage:@"2 puffs"
                                                                interval:@"Hourly"
                                                                   start:@"11/09/2013"
                                                                     end:@"23/09/2013"];
    [temp addObject:medication1];
    [temp addObject:medication2];
    [temp addObject:medication3];
    
}



- (IBAction)saveButton:(UIButton *)sender {
}
- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
