//
//  LeftViewController.m
//  RedBourne
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import "LeftViewController.h"
#import "ChildModel.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"


@interface LeftViewController ()

@end

@implementation LeftViewController

@synthesize filterChildArray;
@synthesize childSearchBar;
@synthesize childList;

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}


//-(id)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder]){
//        [self fillDataWithJSON];
//    }
//    
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self fillDataHardCode];
    [self fillDataWithJSON];
    
    
    [[UIBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:0.863 green:0.408 blue:0.004 alpha:1.000], UITextAttributeTextColor,
      [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0], UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"AmericanTypewriter" size:0.0], UITextAttributeFont,nil]
                                          forState:UIControlStateNormal];
    
    
    //initialize the filteredChildArray
    
    filterChildArray = [NSMutableArray arrayWithCapacity:[childList count]];
    
    [[self tableView] reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [filterChildArray count];
    }
    else
    {
        return [childList count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    ChildModel *theChild = [[ChildModel alloc] init];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        theChild = [self.filterChildArray objectAtIndex:indexPath.row];
    } else {
        theChild = self.childList[indexPath.row];
    }
    
    cell.textLabel.text = theChild.fullName;
    cell.detailTextLabel.text = theChild.crn;

    //Put thumbnail in the cell
    [cell.imageView setImageWithURL:[NSURL URLWithString:theChild.thumbnail]
                   placeholderImage:[UIImage imageNamed:@"placeholder.jpg"]];
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChildModel *selectChild = [[ChildModel alloc] init];

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        selectChild = [self.filterChildArray objectAtIndex:indexPath.row];
    } else {
        selectChild = self.childList[indexPath.row];
    }
    if (_delegate) {
        [_delegate selectedChild:selectChild];
    }
}

#pragma mark - Fill data entity


-(void)fillDataWithJSON
{
    NSURL *url = [[NSURL alloc] initWithString:@"https://dl.dropboxusercontent.com/u/3741832/develop/childInfo_med.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
     {
         NSMutableArray *temp = [[NSMutableArray alloc] init];
         for (NSDictionary *child in JSON)
         {
             NSMutableArray *tempMedicationArray = [[NSMutableArray alloc] init];
             MedicationModel *med = [[MedicationModel alloc] init];
             for (NSDictionary *medication in child[@"medication"]) {
                 med = [[MedicationModel alloc] initWithName:medication[@"name"]
                                                      dosage:medication[@"dosage"]
                                                    interval:medication[@"interval"]
                                                       start:medication[@"start"]
                                                         end:medication[@"end"]];
                 [tempMedicationArray addObject:med];
             }
             ChildModel *childModel = [[ChildModel alloc] initWithFirstName:child[@"firstName"]
                                                                    surName:child[@"surName"]
                                                                        crn:child[@"crn"]
                                                                dateOfBirth:child[@"dateOfBirth"]
                                                             medicareNumber:child[@"medicareNumber"]
                                                           registrationDate:child[@"registrationDate"]
                                                             countryOfBirth:child[@"countryOfBirth"]
                                                                 disability:child[@"disability"]
                                                        disabilityStartDate:child[@"disabilityStartDate"]
                                                         disabilityComments:child[@"disabilityComments"]
                                                               specialNeeds:child[@"specialNeeds"]
                                                      specialNeedsStartDate:child[@"specialNeedsStartDate"]
                                                       specialNeedsComments:child[@"specialNeedsComments"]
                                                                  thumbnail:child[@"thumbnail"]
                                                                   filename:child[@"filename"]
                                                                medications:tempMedicationArray];
             [temp addObject:childModel];
         }
         self.childList = [[NSMutableArray alloc] initWithArray:temp];
         
         [self.tableView reloadData];    // this is necessary, because by the time this runs,
                                         // tableView:numberOfRowsInSection has already executed
         
         //notification boardcast for rightViewController to wait to load data.
         [[NSNotificationCenter defaultCenter] postNotificationName:@"fillDataWithJSONFinishedLoading" object:nil];
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
         NSLog(@"NSError: %@",[error localizedDescription]);
     }];
    [operation start];

}

-(void)fillDataHardCode
{
    MedicationModel *a = [[MedicationModel alloc] initWithName:@"aa" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    MedicationModel *b = [[MedicationModel alloc] initWithName:@"bb" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    MedicationModel *c = [[MedicationModel alloc] initWithName:@"cc" dosage:@"2 puffs" interval:@"Hourly" start:@"11/09/2013" end:@"23/09/2013"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] initWithObjects:a,b,c,nil];
    
    
    ChildModel *child1 = [[ChildModel alloc] initWithFirstName:@"Kiddy" surName:@"Shun" crn:@"123321123" dateOfBirth:@"20-09-1990" medicareNumber:@"med12032" registrationDate:@"31-09-1992" countryOfBirth:[NSNumber numberWithInt:20] disability:@"no" disabilityStartDate:@"" disabilityComments:@"" specialNeeds:@"no" specialNeedsStartDate:@"" specialNeedsComments:@"" thumbnail:@"https://dl.dropboxusercontent.com/u/3741832/develop/img_32/bender_32.png" filename:@"https://dl.dropboxusercontent.com/u/3741832/develop/img_256/bender_256.png" medications:temp];
    

    self.childList = [[NSMutableArray alloc] initWithObjects:child1,child1, nil];
    
    [self.tableView reloadData];
    
    
}


#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filterChildArray removeAllObjects];
    
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(SELF.firstName contains[c] %@) OR (SELF.surName contains[c] %@) OR (SELF.crn contains[c] %@)",searchText,searchText,searchText];
    self.filterChildArray = [NSMutableArray arrayWithArray:[self.childList filteredArrayUsingPredicate:predicate]];
}


#pragma mark - UISearchDisplayController Delegate Methods

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


@end
