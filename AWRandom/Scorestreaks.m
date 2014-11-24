//
//  Scorestreaks.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Scorestreaks.h"

@implementation Scorestreaks

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      int scorestreakCount = [self getScorestreakCount:pointsRemaining];
      NSLog(@"Scorestreak count: %d points used: %ld/%ld", scorestreakCount, (long)self.pointsUsed, (long)pointsRemaining);
      
   }
   
   return self;
}


- (int)getScorestreakCount:(NSInteger) pointsRemaining{
   int scorestreakChance = (arc4random()%100) + 1;
   int scorestreakCount = 0;
   if (scorestreakChance <= PROBABILITY_0_SCORESTREAK){
      self.pointsUsed += 0;
      scorestreakCount = 0;
   }else if (scorestreakChance >= PROBABILITY_0_SCORESTREAK && scorestreakChance <= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK){
      self.pointsUsed += 1;
      scorestreakCount = 1;
   }else if (scorestreakChance >= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK && scorestreakChance <= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK + PROBABILITY_2_SCORESTREAK){
      self.pointsUsed += 2;
      scorestreakCount = 2;
   }else if (scorestreakChance >= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK + PROBABILITY_2_SCORESTREAK && scorestreakChance <= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK + PROBABILITY_2_SCORESTREAK + PROBABILITY_3_SCORESTREAK){
      self.pointsUsed += 3;
      scorestreakCount = 3;
   }
   else if (scorestreakChance >= PROBABILITY_0_SCORESTREAK + PROBABILITY_1_SCORESTREAK + PROBABILITY_2_SCORESTREAK + PROBABILITY_3_SCORESTREAK){
      self.pointsUsed += 5;
      scorestreakCount = 4;
   }else{
      NSLog(@"WHATTT");
   }
   
   while (self.pointsUsed > pointsRemaining){
      self.pointsUsed = 0;
      return [self getScorestreakCount:pointsRemaining];
   }
   
   return scorestreakCount;
}

@end
