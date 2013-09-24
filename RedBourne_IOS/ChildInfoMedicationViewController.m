//
//  ChildInfoDisabilityViewController.m
//  RedBourne_IOS
//
//  Created by Jerry on 16/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "ChildInfoMedicationViewController.h"

@interface ChildInfoMedicationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *medicationName;
@property (weak, nonatomic) IBOutlet UILabel *dosage;
@property (weak, nonatomic) IBOutlet UILabel *interval;
@property (weak, nonatomic) IBOutlet UILabel *start;
@property (weak, nonatomic) IBOutlet UILabel *end;

@end

@implementation ChildInfoMedicationViewController

@synthesize medicationList;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
}


#pragma mark - Table view Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return medicationList.count;
}





-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *medicationCellIdentifier = @"medicationCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:medicationCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:medicationCellIdentifier];
        
    }
    
    
}




-(void)fillDataHardCode
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    MedicationModel *medication1 = [[MedicationModel alloc] initWithName:@"Asthma1" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    MedicationModel *medication2 = [[MedicationModel alloc] initWithName:@"Asthma2" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    MedicationModel *medication3 = [[MedicationModel alloc] initWithName:@"Asthma3" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    
    
    [temp addObject:medication1];
    [temp addObject:medication2];
    [temp addObject:medication3];

    self.medicationList = [[NSMutableArray alloc] initWithArray:temp];
    
    [self.tableView reloadData];
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(UIButton *)sender {
}
- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
