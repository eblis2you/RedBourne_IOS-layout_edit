//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *medicationListTableView;
@end

@implementation ChildInfoMedicationViewController
@synthesize medicationList;



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
    self.medicationList = [[NSMutableArray alloc] initWithObjects:@"No1", @"No2",@"No3",@"No4",@"No5", nil];
    
}


#pragma mark - Table view Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return medicationList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [medicationList objectAtIndex:indexPath.row];
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
