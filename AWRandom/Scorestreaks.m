//
//  Scorestreaks.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Scorestreaks.h"
@interface Scorestreaks()
@property (nonatomic, strong) NSMutableArray *streakArray;
@end
@implementation Scorestreaks

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      self.streakArray = [[NSMutableArray alloc] init];
      int scorestreakCount = [self getScorestreakCount:pointsRemaining];
      [self pickScorestreaks:scorestreakCount];
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

- (void)pickScorestreaks:(int)count{
   //pick equipment
   NSBundle *streakBundle = [NSBundle mainBundle];
   NSString *streakPlistPath = [streakBundle pathForResource:@"Scorestreaks" ofType:@"plist"];
   NSDictionary *streakDictionary = [[NSDictionary alloc] initWithContentsOfFile:streakPlistPath];
   NSArray *streakLib = [streakDictionary objectForKey:@"scorestreaks"];
   for (int i = 0; i < count; i ++){
      int streakCount = arc4random()%[streakLib count];
      while ([self.streakArray containsObject:[NSNumber numberWithInt:streakCount]]){
         streakCount = arc4random()%[streakLib count];
      }
      [self.streakArray addObject:[NSNumber numberWithInt:streakCount]];
   }
   NSLog(@"array: %@", self.streakArray);
}

@end
