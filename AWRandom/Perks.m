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

- (void)setPerkName:(int)perkIndex wildcard:(bool) wildcard clear:(bool)clear{
   NSString *perkName;
   if (clear){
      perkName = @"";
   }else{
      perkName = [self retrievePerkKey:[NSString stringWithFormat:@"Perk %d", perkIndex]];
   }
   if (perkIndex == 1 && wildcard == NO){
      self.perk1Name = perkName;
   }else if (perkIndex == 2 && wildcard == NO){
      self.perk2Name = perkName;
   }else if (perkIndex == 3 && wildcard == NO){
      self.perk3Name = perkName;
   }else if (perkIndex == 1 && wildcard == YES){
      self.wildCardPerk1Name = perkName;
   }else if (perkIndex == 2 && wildcard == YES){
      self.wildCardPerk2Name = perkName;
   }else if (perkIndex == 3 && wildcard == YES){
      self.wildCardPerk3Name = perkName;
   }
}
- (void)selectPerk:(int)perkIndex withPointsRemaining:(NSInteger) pointsRemaining{
   if (pointsRemaining == 0){
      //NSLog(@"No Perk %d", perkIndex);
      [self setPerkName:perkIndex wildcard:NO clear:YES];
      return;
   }
   int used = 0;
   int perkChance = arc4random()%100;
   bool wildcard = NO;
   if (perkChance < (100 - PROBABILTIY_OF_PERK_WILDCARD)){
      //select perk 1
      used += 1;
      //NSLog(@"Perk %d", perkIndex);
      //get perk name
      [self setPerkName:perkIndex wildcard:NO clear:NO];
      if (perkChance < PROBABILTIY_OF_PERK_WILDCARD){// 20/80 = 25%
         used += 2;
         wildcard = YES;
         //NSLog(@"Perk %d WildCard", perkIndex);
         [self setPerkName:perkIndex wildcard:YES clear:NO];
         
      }
   }else{
      //NSLog(@"Nooo Perk %d", perkIndex);
      [self setPerkName:perkIndex wildcard:NO clear:YES];
   }
   
   if (used > pointsRemaining){
      [self setPerkName:perkIndex wildcard:NO clear:YES];
      if (wildcard){
         [self setPerkName:perkIndex wildcard:YES clear:YES];
         
      }
      [self selectPerk:perkIndex withPointsRemaining:pointsRemaining];
   }else{
      self.pointsUsed += used;
   }
}

-(NSString *) retrievePerkKey:(NSString *)key{
   NSBundle *perkBundle = [NSBundle mainBundle];
   NSString *perkPlistPath = [perkBundle pathForResource:@"Perks" ofType:@"plist"];
   NSDictionary *perkDictionary = [[NSDictionary alloc] initWithContentsOfFile:perkPlistPath];
   
   NSArray *perkArray = [perkDictionary objectForKey:key];
   int rand = arc4random()%[perkArray count];
   NSString *perk = [perkArray objectAtIndex:rand];
   
   return perk;
}

@end
