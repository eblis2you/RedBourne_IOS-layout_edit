//
//  ChildModel.h
//  RedBourne
//  Sample childMode, further modification needed.
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MedicationModel.h"


@interface ChildModel : NSObject

//Person details
@property (strong, nonatomic) NSNumber *Id;
@property (strong, nonatomic) NSNumber *accountId;

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *middleName;
@property (strong, nonatomic) NSString *surName;
@property (strong, nonatomic) NSString *crn;

@property (strong, nonatomic) NSString *medicareNumber;
@property (strong, nonatomic) NSNumber *countryOfBirth;
@property (strong, nonatomic) NSNumber *ethnicGroup;

@property (strong, nonatomic) NSNumber *primaryLanguage;
@property (strong, nonatomic) NSString *disabilityComments;
@property (strong, nonatomic) NSString *specialNeedsComments;

//need to chage data type to Date
@property (strong, nonatomic) NSDate *registrationDate;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (strong, nonatomic) NSString *disabilityStartDate;
@property (strong, nonatomic) NSString *specialNeedsStartDate;
@property (strong, nonatomic) NSString *applySchoolAgePercentageFrom;

//need to chage data type to BOOL
@property (strong, nonatomic) NSString *disability;
@property (strong, nonatomic) NSString *specialNeeds;

//@property (strong, nonatomic) GuardianModel *guardians;
//@property (strong, nonatomic) IndigenousCode *indigenousCode;
//@property (strong, nonatomic) SchoolStatus *schoolStatus;


@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSString *filename;


@property (strong, nonatomic) NSMutableArray *medications;


-(id)initWithFirstName:(NSString *)aFirstName
               surName:(NSString *)aSurName
                   crn:(NSString *)aCrn
           dateOfBirth:(NSDate *)aDateOfBirth
        medicareNumber:(NSString *)aMedicareNumber
      registrationDate:(NSDate *)aRegistrationDate
        countryOfBirth:(NSNumber *)aCountryOfBirth
            disability:(NSString *)theDisability
   disabilityStartDate:(NSString *)theDisabilityStartDate
    disabilityComments:(NSString *)aDisabilityComments
          specialNeeds:(NSString *)theSpecialNeeds
 specialNeedsStartDate:(NSString *)aSpecialNeedsStartDate
  specialNeedsComments:(NSString *)aSpecialNeedsComments
             thumbnail:(NSString *)aThumbnail
              filename:(NSString *)aFilename
           medications:(NSMutableArray *)aMedicationList;

//-(id)initWithJSON;

-(NSString *)fullName;



+(void)saveChild:(ChildModel *)aUser;

@end
