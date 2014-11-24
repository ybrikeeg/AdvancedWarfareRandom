//
//  Attachments.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Attachments : NSObject

@property (nonatomic, strong) NSMutableArray *attachmentList;

- (instancetype)initWithGunName:(NSString *)gunName numberOfAttachments:(int)attachmentCount isPrimary:(BOOL)isPrimary;
@end
