//
//  ChildModel.m
//  RedBourne
//  Sample childMode, further modification needed.
//
//  Created by Jerry on 22/08/13.
//  Copyright (c) 2013 Jerry. All rights reserved.
//

#import "ChildModel.h"
#import "MedicationModel.h"

@implementation ChildModel

-(id)init {
    self = [super init];
    return self;
}

-(id)initWithFirstName:(NSString *)aFirstName
               surName:(NSString *)aSurName
                   crn:(NSString *)aCrn
           dateOfBirth:(NSString *)aDateOfBirth
        medicareNumber:(NSString *)aMedicareNumber
      registrationDate:(NSString *)aRegistrationDate
        countryOfBirth:(NSNumber *)aCountryOfBirth
            disability:(NSString *)theDisability
   disabilityStartDate:(NSString *)theDisabilityStartDate
    disabilityComments:(NSString *)aDisabilityComments
          specialNeeds:(NSString *)theSpecialNeeds
 specialNeedsStartDate:(NSString *)aSpecialNeedsStartDate
  specialNeedsComments:(NSString *)aSpecialNeedsComments
             thumbnail:(NSString *)aThumbnail
              filename:(NSString *)aFilename
            medications:(NSMutableArray *)aMedicationArray
{
    self = [super init];
    if (self)
    {
        self.firstName = aFirstName;
        self.surName = aSurName;
        self.crn = aCrn;
        self.dateOfBirth = aDateOfBirth;
        self.medicareNumber = aMedicareNumber;
        self.registrationDate = aRegistrationDate;
        self.countryOfBirth = aCountryOfBirth;
        self.thumbnail = aThumbnail;
        self.filename = aFilename;
        self.disability = theDisability;
        self.disabilityStartDate = theDisabilityStartDate;
        self.disabilityComments = aDisabilityComments;
        self.specialNeeds = theSpecialNeeds;
        self.specialNeedsStartDate = theDisabilityStartDate;
        self.specialNeedsComments = aSpecialNeedsComments;
        self.medications = aMedicationArray;
    }
    return self;
};

-(NSString *)fullName{
    if (self.middleName == nil) {
        return [@[self.firstName, self.surName] componentsJoinedByString:@" "];
    } else {
        return [@[self.firstName, self.middleName, self.surName] componentsJoinedByString:@" "];
    }
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"<MedicationModel: %p>\nfirstName: %@\nsurName: %@\ncrn: %@\nDOB: %@\nmedicareNo: %@\nregistrationDate: %@\ndisability: %@", self, self.firstName, self.surName, self.crn, self.dateOfBirth, self.medicareNumber, self.registrationDate, self.disability];
}


+(void)saveChild:(ChildModel *)aChild{

}



@end
