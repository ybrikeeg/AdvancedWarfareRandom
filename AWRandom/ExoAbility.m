//
//  ExoAbility.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "ExoAbility.h"

@implementation ExoAbility

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining wildcardDisabled:(bool)wildcardDisabled{
   
   self = [super init];
   if (self) {
      self.exoAbilityArrayStrings = [[NSMutableArray alloc] init];
      int exoabilityCount = [self getExoabilityCount:pointsRemaining wildcardDisabled:wildcardDisabled];
      [self pickExoabilities:exoabilityCount];
   }
   
   return self;
}

- (void)pickExoabilities:(int)count{
   //pick equipment
   NSBundle *exoabilityBundle = [NSBundle mainBundle];
   NSString *exoabilityPlistPath = [exoabilityBundle pathForResource:@"Exoabilities" ofType:@"plist"];
   NSDictionary *exoabilityDictionary = [[NSDictionary alloc] initWithContentsOfFile:exoabilityPlistPath];
   NSArray *exoabilityLib = [exoabilityDictionary objectForKey:@"exoabilities"];
   
   NSMutableArray *exoabilityArrayIndices = [[NSMutableArray alloc] init];
   
   for (int i = 0; i < count; i ++){
      int exoabilityCount = arc4random()%[exoabilityLib count];
      while ([exoabilityArrayIndices containsObject:[NSNumber numberWithInt:exoabilityCount]]){
         exoabilityCount = arc4random()%[exoabilityLib count];
      }
      [exoabilityArrayIndices addObject:[NSNumber numberWithInt:exoabilityCount]];
   }
   //sort array
   [exoabilityArrayIndices sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
      return [obj1 compare:obj2];
   }];
   
   for (int i = 0; i < count; i ++){
      [self.exoAbilityArrayStrings addObject: [exoabilityLib objectAtIndex:[[exoabilityArrayIndices objectAtIndex:i] intValue]]];
   }
}

- (int)getExoabilityCount:(NSInteger) pointsRemaining wildcardDisabled:(bool)wildcardDisabled{
   int exoabilityChance = (arc4random()%100) + 1;
   int exoabilityCount = 0;
   if (exoabilityChance <= PROBABILITY_0_EXO){
      self.pointsUsed += 0;
      exoabilityCount = 0;
   }else if (exoabilityChance > PROBABILITY_0_EXO && exoabilityChance <= PROBABILITY_0_EXO + PROBABILITY_1_EXO){
      self.pointsUsed += 1;
      exoabilityCount = 1;
   }else if (exoabilityChance > PROBABILITY_0_EXO + PROBABILITY_1_EXO){
      self.pointsUsed += 3;
      exoabilityCount = 2;
   }else{
      NSLog(@"WHATTT");
   }
   
   while (self.pointsUsed > pointsRemaining || (wildcardDisabled && exoabilityCount == 2)){
      self.pointsUsed = 0;
      return [self getExoabilityCount:pointsRemaining wildcardDisabled:wildcardDisabled];
   }
   
   return exoabilityCount;
}

@end
