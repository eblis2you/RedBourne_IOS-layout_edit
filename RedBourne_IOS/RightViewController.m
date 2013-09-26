//
//  RightViewController.m
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import "RightViewController.h"
#import "ChildModel.h"
#import "ChildInfoGeneralViewController.h"
#import "ChildInfoDisabilityViewController.h"
#import "ChildInfoMedicationViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@interface RightViewController()
@property (weak, nonatomic) IBOutlet UITableView *childMedicationListTableView;
@property NSArray *localMedicationList;
@end


@implementation RightViewController

#pragma mark - Table View Data Source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.localMedicationList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    MedicationModel *med = self.localMedicationList[indexPath.row];
    cell.textLabel.text =med.name;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ChildInfoMedicationViewController *medicationEditVC = [[ChildInfoMedicationViewController alloc] init];
    medicationEditVC.MedicationNeedEdit = [self.localMedicationList objectAtIndex:indexPath.row];
    medicationEditVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:medicationEditVC animated:YES completion:nil];
}


#pragma mark - View Lifecycle
// segmented control as the custom title view

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	NSArray *segmentTextContent = [NSArray arrayWithObjects:
                                   NSLocalizedString(@"GENERAL", @""),
                                   NSLocalizedString(@"DISABILITY", @""),
                                   NSLocalizedString(@"MEDICATION", @""),
								   nil];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
	self.segmentedControl.selectedSegmentIndex = 0;
	self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [self.segmentedControl sizeToFit];
	[self.segmentedControl addTarget:self
                              action:@selector(segmentAction:)
                    forControlEvents:UIControlEventValueChanged];
	/*
     Visual customization
     */
    
//    UIImage *navBarImage = [UIImage imageNamed:@"ipad-menubar-right.jpg"];
//    [[UINavigationBar appearance] setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:215/255.0f green:75/255.0f blue:75/255.0f alpha:1.0f]];
//    UIColor* bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ipad-BG-pattern.png"]];
//    [self.view setBackgroundColor:bgColor];
    
    
    
    self.navBarItem.titleView = self.segmentedControl;
    UIBarButtonItem *editChildButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                     target:self
                                                                                action:@selector(editChildInfo)];
    self.navBarItem.rightBarButtonItem = editChildButton;
    
    
    if (_child != nil) {
        
    }
}



/*
Update the UI to reflect the child set on initial load.
*/
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(refreshUI)
//                                                 name:@"fillDataWithJSONFinishedLoading"
//                                               object:nil];
//    
//    NSMutableArray *temp = [[NSMutableArray alloc] init];
//    MedicationModel *medication1 = [[MedicationModel alloc] initWithName:@"Asthma11"
//                                                                  dosage:@"2 puffs"
//                                                                interval:@"Hourly"
//                                                                   start:@"11/09/2013"
//                                                                     end:@"23/09/2013"];
//    MedicationModel *medication2 = [[MedicationModel alloc] initWithName:@"Asthma22"
//                                                                  dosage:@"2 puffs"
//                                                                interval:@"Hourly"
//                                                                   start:@"11/09/2013"
//                                                                     end:@"23/09/2013"];
//    MedicationModel *medication3 = [[MedicationModel alloc] initWithName:@"Asthma33"
//                                                                  dosage:@"2 puffs"
//                                                                interval:@"Hourly"
//                                                                   start:@"11/09/2013"
//                                                                     end:@"23/09/2013"];
//    [temp addObject:medication1];
//    [temp addObject:medication2];
//    [temp addObject:medication3];
//    
//    self.localMedicationList = [[NSMutableArray alloc] initWithArray:temp];

    
 
}


/*
 Modifice Child information based on current segemented page selected. 
 */

- (void) editChildInfo {
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
        {
            ChildInfoGeneralViewController *profileEditVC = [[ChildInfoGeneralViewController alloc] init];
            profileEditVC.child = self.child;
            profileEditVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:profileEditVC animated:YES completion:nil];
        }   break;
        case 1:
        {
            
            ChildInfoDisabilityViewController *disabilityEditVC = [[ChildInfoDisabilityViewController alloc] init];
            disabilityEditVC.child = self.child;
            disabilityEditVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:disabilityEditVC animated:YES completion:nil];
        }   break;
        case 2:	
        {
            
            ChildInfoMedicationViewController *medicationEditVC = [[ChildInfoMedicationViewController alloc] init];
            medicationEditVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:medicationEditVC animated:YES completion:nil];
        }   break;
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated, in this case the IBOutlets.
    [self setNameLabel:nil];
    [self setDescriptionLabel:nil];
    [self setIconImageView:nil];
}

#pragma mark - Child Selection Delegate

-(void)selectedChild:(ChildModel *)newChild
{
    [self setChild:newChild];
    
    //Dismisses the popover if it's showing.
    if (_popover != nil) {
        [_popover dismissPopoverAnimated:YES];
    }
}

#pragma mark - Overridden setters

-(void)setChild:(ChildModel *)newChild
{
    //Make sure we're not setting up the same child.
    if (_child != newChild) {
        _child = newChild;
        //Update the UI to reflect the new child selected from the list.
        [self refreshUI];

    }
}

#pragma mark - New Methods
-(void)refreshUI
{
   
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            [self displayChildInfo_General];
            break;
        case 1:
            [self displayChildInfo_Disability];
            break;
        case 2:
            [self displayChildInfo_Medication];
            break;
        default:
            break;
    }
    
    _nameLabel.text =  self.child.fullName;
    _descriptionLabel.text = [NSString stringWithFormat:@"CRN: %@",_child.crn];

    [self.iconImageView removeFromSuperview];
    self.iconImageView = nil;

    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.frame = CGRectMake(20, 75, 120, 136);
    
    [self.view addSubview:self.iconImageView];
    
    self.iconImageView.image = nil;
    
    NSURL *imageURL = [NSURL URLWithString:self.child.filename];
    
    UIImage *placeholder = [UIImage imageNamed:@"placeholder.jpg"];
    
    
    [self.iconImageView setImageWithURL:imageURL placeholderImage:placeholder];

    
    if (_child != nil) {
        self.localMedicationList = _child.medications;
    }
    
    [self.childMedicationListTableView reloadData];
    
}


#pragma mark - UISplitViewDelegate methods
-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController
         withBarButtonItem:(UIBarButtonItem *)barButtonItem
      forPopoverController:(UIPopoverController *)pc
{
    //Grab a reference to the popover
    self.popover = pc;
    
    //Set the title of the bar button item
    barButtonItem.title = @"Child";
    
    //Set the bar button item as the Nav Bar's leftBarButtonItem
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    //Remove the barButtonItem.
    [_navBarItem setLeftBarButtonItem:barButtonItem animated:YES];
    
    //Nil out the pointer to the popover.
    _popover = nil;
}


- (IBAction)segmentAction:(id)sender
{
	// The segmented control was clicked, handle it here
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            [self displayChildInfo_General];
            break;
        case 1:
            [self displayChildInfo_Disability];
            break;
        case 2:{
            [self displayChildInfo_Medication];
 
        }
            break;
        default:
            break;
    }
}

- (void)displayChildInfo_General
{
    _childLabel1.text = [NSString stringWithFormat:@"Date of Birth:	 %@", _child.dateOfBirth];
    _childLabel2.text = [NSString stringWithFormat:@"Medicare Number: %@", _child.medicareNumber];
    _childLabel3.text = [NSString stringWithFormat:@"Registration Date:	%@", _child.registrationDate];
    
    if (![_childLabel5.text isEqual: @""]) {
        _childLabel5.text = @"";
        _childLabel6.text = @"";
        _childLabel7.text = @"";

    }
}

- (void)displayChildInfo_Disability
{
    _childLabel1.text = [NSString stringWithFormat:@"Disability: %@", self.child.disability];
    _childLabel2.text = [NSString stringWithFormat:@"Disability Start Date: %@", self.child.disabilityStartDate];
    _childLabel3.text = [NSString stringWithFormat:@"Comments: %@", self.child.disabilityComments];
    
    _childLabel5.text = [NSString stringWithFormat:@"Special Needs: %@", self.child.specialNeeds];
    _childLabel6.text = [NSString stringWithFormat:@"Special Needs Start Date: %@", self.child.specialNeedsStartDate];
    _childLabel7.text = [NSString stringWithFormat:@"Special Needs Comment: %@", self.child.specialNeedsComments];
    
    
}

- (void)displayChildInfo_Medication
{
    _childLabel1.text = [NSString stringWithFormat:@"Medication page"];
    MedicationModel *med = self.child.medications[0];
    _childLabel2.text = [NSString stringWithFormat:@"Name: %@", med.name ];
//    _childLabel3.text = [NSString stringWithFormat:@"Dosag: %@", self.child.medication.dosage ];
//    _childLabel4.text = [NSString stringWithFormat:@"Interval: %@", self.child.medication.interval ];
//    
//    _childLabel5.text = [NSString stringWithFormat:@"Start Date: %@", self.child.medication.strat];
//    _childLabel6.text = [NSString stringWithFormat:@"End Date: %@", self.child.medication.end];
    _childLabel7.text = @"";
    _childLabel8.text = @"";



}



@end
