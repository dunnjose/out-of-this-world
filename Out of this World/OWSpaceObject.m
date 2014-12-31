//
//  OWSpaceObject.m
//  Out of this World
//
//  Created by Dunn, Joseph on 11/2/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "OWSpaceObject.h"
#import "AstronomicalData.h"

@implementation OWSpaceObject

-(id)init {
    self = [self initWithData:nil addImage:nil];
    return self;
    
}

-(id)initWithData:(NSDictionary *)data addImage:(UIImage *)image    {
    
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;    
    
}
@end
