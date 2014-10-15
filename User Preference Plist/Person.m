//
//  Person.m
//  List Persist
//
//  Created by Dr Vanessa Paugh on 9/29/14.
//  Copyright (c) 2014 Dr Vanessa Paugh. All rights reserved.
//

#import "Person.h"

static NSString *kUserNameKey = @"IADNameString";
static NSString *kPassCodeKey = @"IADCodeFloat";
static NSString *kUserStepperKey = @"IADStepperInteger";
static NSString *kUserSwitchKey = @"IADSwitchBool";
static NSString *kSegmentColorKey = @"IADSegmentColor";

@implementation Person

- (instancetype)initWithDefaults:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.dictionary = dictionary;
        return self;
    } else {
        return nil;
    }
}

- (NSString *)nameString
{
    if (_nameString == nil) {
        _nameString = @"Enter Name";
    }
        return _nameString;
}

- (void)saveDataToUserDefaults
{
   [self.dictionary setValue:self.nameString forKey:kUserNameKey];
   [self.dictionary setValue:[[NSNumber numberWithFloat:self.numberFloat]stringValue] forKey:kPassCodeKey];
   [self.dictionary setValue:[NSString stringWithFormat:@"%ld", (long)self.stepperInteger] forKey:kUserStepperKey];
   [self.dictionary setValue:self.switchBool ? @"true" : @"false" forKey:kUserSwitchKey];
   [self.dictionary setValue:self.segmentString forKey:kSegmentColorKey];
}

- (void)loadDataFromUserDefaults
{
   self.nameString = [self.dictionary valueForKey:kUserNameKey];
   self.numberFloat = [[self.dictionary valueForKey:kPassCodeKey] floatValue];
   self.stepperInteger = [[self.dictionary valueForKey:kUserStepperKey] intValue];
   self.switchBool = [[self.dictionary valueForKey:kUserSwitchKey] boolValue];
   self.segmentString = [self.dictionary valueForKey:kSegmentColorKey];
}

- (void)logAllValues {
   NSLog(@"nameString: %@", self.nameString);
   NSLog(@"numberFloat: %f", self.numberFloat);
   NSLog(@"stepperInteger: %ld", (long)self.stepperInteger);
   NSLog(self.switchBool ? @"true" : @"false");
   NSLog(@"segmentString: %@", self.segmentString);
}

@end
