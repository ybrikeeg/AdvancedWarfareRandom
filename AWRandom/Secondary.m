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
      if (exist < (100 - PROBABILITY_SECONDARY_EXIST) || pointsRemaining == 0){
         self.secondaryName = @"blank";
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
   NSBundle *gunBundle = [NSBundle mainBundle];
   NSString *gunPlistPath = [gunBundle pathForResource:@"Secondary" ofType:@"plist"];
   NSDictionary *gunOtherDictionary = [[NSDictionary alloc] initWithContentsOfFile:gunPlistPath];
   
   int gunCount = arc4random()%[gunOtherDictionary count];
   //get the gun name
   return [[gunOtherDictionary allKeys] objectAtIndex:gunCount];
}


- (int)getAttachmentCount:(NSInteger) pointsRemaining{
   int attachmentChance = (arc4random()%100) + 1;
   int attachCount = 0;
   if (attachmentChance <= PROBABILITY_0_ATTACHMENT_SECONDARY){
      self.pointsUsed += 0;
      attachCount = 0;
   }else if (attachmentChance > PROBABILITY_0_ATTACHMENT_SECONDARY && attachmentChance <= PROBABILITY_0_ATTACHMENT_SECONDARY + PROBABILITY_1_ATTACHMENT_SECONDARY){
      self.pointsUsed += 1;
      attachCount = 1;
   }else if (attachmentChance > PROBABILITY_0_ATTACHMENT_SECONDARY + PROBABILITY_1_ATTACHMENT_SECONDARY){
      self.pointsUsed += 3;
      attachCount = 2;
   }else{
      NSLog(@"WHATTT");
   }
   
   while (self.pointsUsed > pointsRemaining){
      self.pointsUsed = 1;
      return [self getAttachmentCount: pointsRemaining];
   }
   
   return attachCount;
}

@end
