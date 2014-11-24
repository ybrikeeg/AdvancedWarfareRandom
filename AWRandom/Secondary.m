//
//  Secondary.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Secondary.h"

@implementation Secondary

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      self.pointsUsed = 0;
      //0 pts or more
      int exist = arc4random()%100;
      if (exist < 20 || pointsRemaining == 0){
         //0 points
         self.pointsUsed += 0;
         self.secondaryName = @"blank";
         NSLog(@"dne");
      }else{
         //get gun name
         self.secondaryName = [self getSecondaryName];
         self.pointsUsed +=1;
         
         
         int attachmentCount = [self getAttachmentCount: pointsRemaining];
         Attachments *attachments = [[Attachments alloc] initWithGunName:self.secondaryName numberOfAttachments:attachmentCount];
         self.attachments = attachments;
      }
   }
   
   return self;
}

- (NSString *)getSecondaryName{
   return @"secondary gun";
}

- (int)getAttachmentCount:(NSInteger) pointsRemaining{
   int attachmentChance = arc4random()%100;
   int attachCount = 0;
   if (attachmentChance <= 49){
      self.pointsUsed += 0;
      attachCount = 0;
   }else if (attachmentChance >= 50 && attachmentChance <= 74){
      self.pointsUsed += 1;
      attachCount = 1;
   }else if (attachmentChance >= 75 && attachmentChance <= 99){
      self.pointsUsed += 3;
      attachCount = 2;
   }
   
   while (self.pointsUsed > pointsRemaining){
      self.pointsUsed = 1;
      return [self getAttachmentCount: pointsRemaining];
   }
   
   return attachCount;
}

@end
