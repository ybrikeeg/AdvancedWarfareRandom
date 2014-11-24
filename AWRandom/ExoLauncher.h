//
//  ExoLauncher.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "constants.h"
@interface ExoLauncher : NSObject

@property (nonatomic, strong) NSMutableArray *exolauncherArrayStrings;
@property (nonatomic) NSInteger pointsUsed;

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining;

@end
