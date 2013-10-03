//
//  MedicationModel.h
//  RedBourne_IOS
//
//  Created by Jerry on 20/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MedicationModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *dosage;
@property (strong, nonatomic) NSString *interval;
@property (strong, nonatomic) NSDate *strat;
@property (strong, nonatomic) NSDate *end;

-(id)initWithName:(NSString *)aName
           dosage:(NSString *)aDosage
         interval:(NSString *)aInterval
            start:(NSDate *)theStart
              end:(NSDate *)theEnd;

+(void)save:(MedicationModel *)aMedicationModel;


@end
