//
//  Attachments.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "Attachments.h"
@interface Attachments()
@property (nonatomic) NSInteger loopCount;
@end
@implementation Attachments

- (instancetype)initWithGunName:(NSString *)gunName numberOfAttachments:(int)attachmentCount isPrimary:(BOOL)isPrimary{
   
   self = [super init];
   if (self) {
      self.loopCount = 0;
      self.attachmentList = [[NSMutableArray alloc] init];
      //NSLog(@"Looking for %d attachments for %@", attachmentCount, gunName);
      [self getAttachments:gunName numberOfAttachments: attachmentCount isPrimary:isPrimary];
      //NSLog(@"final attachments: %@", self.attachmentList);
   }
   
   return self;
}

- (void)getAttachments:(NSString *)gunName numberOfAttachments:(int)attachmentCount isPrimary:(BOOL)isPrimary{
   NSBundle *gunBundle = [NSBundle mainBundle];
   NSString *resource = @"Primary";
   if (!isPrimary){
      resource = @"Secondary";
   }
   NSString *gunPlistPath = [gunBundle pathForResource:resource ofType:@"plist"];
   NSDictionary *gunOtherDictionary = [[NSDictionary alloc] initWithContentsOfFile:gunPlistPath];
   
   NSArray *gunAttachments = [gunOtherDictionary objectForKey:gunName];
   NSLog(@"Gun: %@ -> %d", gunName, attachmentCount);
   for (int i = 0; i < attachmentCount; i++){
      while (true){
         if ([gunAttachments count] == 0) break;
         int attachIndex = arc4random()%[gunAttachments count];
         NSString *attachString = [gunAttachments objectAtIndex:attachIndex];
         if (![self.attachmentList containsObject:attachString]){
            if ([self checkIfAttachmentIsCompatible:attachString]){

               [self.attachmentList addObject:attachString];
               break;
            }
            if (self.loopCount == 50){
               return;
            }
         }
      }
   }
}

- (bool)checkIfAttachmentIsCompatible:(NSString *)attach{
   self.loopCount++;
   if (self.loopCount == 50){
      return false;
   }
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
