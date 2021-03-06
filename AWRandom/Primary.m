//
//  Primary.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Primary.h"
#import "Attachments.h"
@implementation Primary

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining{
   
   self = [super init];
   if (self) {
      self.pointsUsed = 0;
      
      int exist = arc4random()%100;
      //even thought points were allocated to primary, no primary will be selected
      if (exist < (100 - PROBABILITY_PRIMARY_EXIST) || pointsRemaining == 0){
         self.primaryName = @"";
         //NSLog(@"dne");
      }else{
         //get gun name
         self.primaryName = [self getPrimaryName];
         self.pointsUsed +=1;
         
         int attachmentCount = [self getAttachmentCount: pointsRemaining];
         Attachments *attachments = [[Attachments alloc] initWithGunName:self.primaryName numberOfAttachments:attachmentCount isPrimary:YES];
         self.attachments = attachments;
      }
   }
   
   return self;
}

- (NSString *)getPrimaryName{
   NSBundle *gunBundle = [NSBundle mainBundle];
   NSString *gunPlistPath = [gunBundle pathForResource:@"Primary" ofType:@"plist"];
   NSDictionary *gunOtherDictionary = [[NSDictionary alloc] initWithContentsOfFile:gunPlistPath];
   
   int gunCount = arc4random()%[gunOtherDictionary count];
   //get the gun name
   return [[gunOtherDictionary allKeys] objectAtIndex:gunCount];
}

- (int)getAttachmentCount: (NSInteger)pointsRemaining{
   int attachmentChance = (arc4random()%100) + 1;
   int attachCount = 0;
   if (attachmentChance <= PROBABILITY_0_ATTACHMENT_PRIMARY){
      self.pointsUsed += 0;
      attachCount = 0;
   }else if (attachmentChance > PROBABILITY_0_ATTACHMENT_PRIMARY && attachmentChance <= PROBABILITY_0_ATTACHMENT_PRIMARY + PROBABILITY_1_ATTACHMENT_PRIMARY){
      self.pointsUsed += 1;
      attachCount = 1;
   }else if (attachmentChance > PROBABILITY_0_ATTACHMENT_PRIMARY + PROBABILITY_1_ATTACHMENT_PRIMARY && attachmentChance <= PROBABILITY_0_ATTACHMENT_PRIMARY + PROBABILITY_1_ATTACHMENT_PRIMARY + PROBABILITY_2_ATTACHMENT_PRIMARY){
      self.pointsUsed += 2;
      attachCount = 2;
   }else if (attachmentChance > PROBABILITY_0_ATTACHMENT_PRIMARY + PROBABILITY_1_ATTACHMENT_PRIMARY + PROBABILITY_2_ATTACHMENT_PRIMARY){
      self.pointsUsed += 4;
      attachCount = 3;
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
