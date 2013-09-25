//
//  Medication.m
//  RedBourne_IOS
//
//  Created by Jerry on 25/09/13.
//  Copyright (c) 2013 Qodo. All rights reserved.
//

#import "Medication.h"

@implementation Medication

-(id)init
{
    self = [super init];
    return self;
}


-(id)initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        self.name = aName;
    }
    
    return self;
}

@end
