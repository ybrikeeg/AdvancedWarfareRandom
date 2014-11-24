//
//  ExoAbility.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "ExoAbility.h"

@implementation ExoAbility

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      
      int exoabilityCount = [self getExoabilityCount:pointsRemaining];
      NSLog(@"Exoability count: %d points used: %ld/%ld", exoabilityCount, (long)self.pointsUsed, (long)pointsRemaining);
   }
   
   return self;
}


- (int)getExoabilityCount:(NSInteger) pointsRemaining{
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
   
   while (self.pointsUsed > pointsRemaining){
      self.pointsUsed = 0;
      return [self getExoabilityCount:pointsRemaining];
   }
   
   return exoabilityCount;
}

@end
