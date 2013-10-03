//
//  MedicationModel.m
//  RedBourne_IOS
//
//  Created by Jerry on 20/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "MedicationModel.h"

@implementation MedicationModel

-(id)init
{
    self = [super init];
    return self;
}

-(id)initWithName:(NSString *)aName
           dosage:(NSString *)aDosage
         interval:(NSString *)aInterval
            start:(NSDate *)theStart
              end:(NSDate *)theEnd
{
    self= [super init];
    if (self) {
        self.name = aName;
        self.dosage = aDosage;
        self.interval = aInterval;
        self.strat = theStart;
        self.end = theEnd;
    }
    
    return self;
    
}

-(NSString *)description
{
 return [NSString stringWithFormat:@"<Medication: %p>\nName: %@\naDosage: %@\naInterval: %@\nstart: %@\nend: %@", self, self.name, self.dosage, self.interval, self.strat, self.end];
}


+(void)save:(MedicationModel *)aMedicationModel
{
    NSLog(@"test");
}


@end
