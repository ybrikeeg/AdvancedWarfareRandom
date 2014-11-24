//
//  Attachments.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Attachments.h"

@implementation Attachments

- (instancetype)initWithGunName:(NSString *)gunName numberOfAttachments:(int)attachmentCount{
   
   self = [super init];
   if (self) {

      self.attachmentList = [[NSMutableArray alloc] init];
      //NSLog(@"Looking for %d attachments for %@", attachmentCount, gunName);
      [self getAttachments:gunName numberOfAttachments: attachmentCount];
      //NSLog(@"final attachments: %@", self.attachmentList);
   }
   
   return self;
}

- (void)getAttachments:(NSString *)gunName numberOfAttachments:(int)attachmentCount{
   NSBundle *gunBundle = [NSBundle mainBundle];
   NSString *gunPlistPath = [gunBundle pathForResource:@"Primary" ofType:@"plist"];
   NSDictionary *gunOtherDictionary = [[NSDictionary alloc] initWithContentsOfFile:gunPlistPath];
   
   NSArray *gunAttachments = [gunOtherDictionary objectForKey:gunName];
   
   for (int i = 0; i < attachmentCount; i++){
      while (true){
      int attachIndex = arc4random()%[gunAttachments count];
      NSString *attachString = [gunAttachments objectAtIndex:attachIndex];
         if (![self.attachmentList containsObject:attachString]){
            if ([self checkIfAttachmentIsCompatible:attachString]){
               //NSLog(@"compatible");
               [self.attachmentList addObject:attachString];
               break;
            }
         }


      }
   }
}

- (bool)checkIfAttachmentIsCompatible:(NSString *)attach{
   NSBundle *attachBundle = [NSBundle mainBundle];
   NSString *attachPlistPath = [attachBundle pathForResource:@"Attachments" ofType:@"plist"];
   NSDictionary *attachDictionary = [[NSDictionary alloc] initWithContentsOfFile:attachPlistPath];
   
   NSArray *gunAttachments = [attachDictionary objectForKey:attach];
   
   for (int i = 0; i < [self.attachmentList count]; i++){
      NSString *currAttach = [self.attachmentList objectAtIndex:i];
      if ([gunAttachments containsObject:currAttach]){
         return false;
      }
   }
   return true;
}
@end
