//
//  Primary.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Attachments.h"
#import "constants.h"

@interface Primary : NSObject

@property (nonatomic, strong) NSString *primaryName;
@property (nonatomic, strong) Attachments *attachments;
@property (nonatomic) NSInteger pointsUsed;


- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining;
@end
