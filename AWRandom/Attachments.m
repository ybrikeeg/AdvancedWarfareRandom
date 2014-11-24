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
   }
   
   return self;
}
@end
