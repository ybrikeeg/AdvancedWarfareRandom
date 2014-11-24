//
//  Perks.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Perks.h"

@implementation Perks

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      self.pointsUsed = 0;
      [self selectPrimaryPerks: pointsRemaining];

      NSLog(@"Points given: %ld points used: %ld", (long)pointsRemaining, (long)self.pointsUsed);
   }
   
   return self;
}

- (void)selectPrimaryPerks:(NSInteger)pointsRemaining{
   NSMutableArray *indexArray = [[NSMutableArray alloc] initWithArray: @[@1, @2, @3]];
   for (int i = 0; i < 3; i++){
      int index = arc4random()%[indexArray count];
      [self selectPerk:[[indexArray objectAtIndex:index] intValue] withPointsRemaining: pointsRemaining - self.pointsUsed];
      [indexArray removeObjectAtIndex:index];
   }
   
}

- (void)selectPerk:(int)perkIndex withPointsRemaining:(NSInteger) pointsRemaining{
   if (pointsRemaining == 0){
      NSLog(@"No Perk %d", perkIndex);
      return;
   }
   int used = 0;
   int perkChance = arc4random()%100;
   if (perkChance < (100 - PROBABILTIY_OF_PERK_WILDCARD)){
      //select perk 1
      used += 1;
      //self.pointsUsed += 1;
      NSLog(@"Perk %d", perkIndex);
      
      if (perkChance < PROBABILTIY_OF_PERK_WILDCARD){// 20/80 = 25%
         //self.pointsUsed += 2;
         used += 2;
         NSLog(@"Perk %d WildCard", perkIndex);
      }
   }else{
      NSLog(@"Nooo Perk %d", perkIndex);
   }

   if (used > pointsRemaining){
      [self selectPerk:perkIndex withPointsRemaining:pointsRemaining];
   }else{
      self.pointsUsed += used;
   }
}

@end
