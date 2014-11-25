
//
//  ExoLauncher.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "ExoLauncher.h"

@implementation ExoLauncher

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining wildcardDisabled:(bool)wildcardDisabled{
   
   self = [super init];
   if (self) {
      self.exolauncherArrayStrings = [[NSMutableArray alloc] init];
      int exolauncherCount = [self getExolauncherCount:pointsRemaining wildcardDisabled:wildcardDisabled];
      [self pickexolaunchers:exolauncherCount];
   }
   
   return self;
}

- (void)pickexolaunchers:(int)count{
   //pick equipment
   NSBundle *exolauncherBundle = [NSBundle mainBundle];
   NSString *exolauncherPlistPath = [exolauncherBundle pathForResource:@"Exolaunchers" ofType:@"plist"];
   NSDictionary *exolauncherDictionary = [[NSDictionary alloc] initWithContentsOfFile:exolauncherPlistPath];
   NSArray *exolauncherLib = [exolauncherDictionary objectForKey:@"exolaunchers"];
   
   NSMutableArray *exolauncherArrayIndices = [[NSMutableArray alloc] init];
   
   for (int i = 0; i < count; i ++){
      int exolauncherCount = arc4random()%[exolauncherLib count];
      while ([exolauncherArrayIndices containsObject:[NSNumber numberWithInt:exolauncherCount]]){
         exolauncherCount = arc4random()%[exolauncherLib count];
      }
      [exolauncherArrayIndices addObject:[NSNumber numberWithInt:exolauncherCount]];
   }
   //sort array
   [exolauncherArrayIndices sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
      return [obj1 compare:obj2];
   }];
   
   for (int i = 0; i < count; i ++){
      [self.exolauncherArrayStrings addObject: [exolauncherLib objectAtIndex:[[exolauncherArrayIndices objectAtIndex:i] intValue]]];
   }
}

- (int)getExolauncherCount:(NSInteger) pointsRemaining wildcardDisabled:(bool)wildcardDisabled{
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

   while (self.pointsUsed > pointsRemaining || (wildcardDisabled && exolauncherCount == 2)){
      self.pointsUsed = 0;
      return [self getExolauncherCount:pointsRemaining wildcardDisabled:wildcardDisabled];
   }
   
   return exolauncherCount;
}
@end
