
//
//  ExoLauncher.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "ExoLauncher.h"

@implementation ExoLauncher

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      
      int exolauncherCount = [self getExolauncherCount:pointsRemaining];
      NSLog(@"Exoability count: %d points used: %ld/%ld", exolauncherCount, (long)self.pointsUsed, (long)pointsRemaining);
   }
   
   return self;
}


- (int)getExolauncherCount:(NSInteger) pointsRemaining{
   int exolauncherChance = (arc4random()%100) + 1;
   int exolauncherCount = 0;
   if (exolauncherChance <= PROBABILITY_0_EXO){
      self.pointsUsed += 0;
      exolauncherCount = 0;
   }else if (exolauncherChance > PROBABILITY_0_EXO && exolauncherChance <= PROBABILITY_0_EXO + PROBABILITY_1_EXO){
      self.pointsUsed += 1;
      exolauncherCount = 1;
   }else if (exolauncherChance > PROBABILITY_0_EXO + PROBABILITY_1_EXO){
      self.pointsUsed += 3;
      exolauncherCount = 2;
   }else{
      NSLog(@"WHATTT");
   }
   
   while (self.pointsUsed > pointsRemaining){
      self.pointsUsed = 0;
      return [self getExolauncherCount:pointsRemaining];
   }
   
   return exolauncherCount;
}
@end
