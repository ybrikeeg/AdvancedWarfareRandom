//
//  Scorestreaks.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scorestreaks : NSObject

@property (nonatomic, strong) NSString *scoreStreak1Name;
@property (nonatomic, strong) NSString *scoreStreak2Name;
@property (nonatomic, strong) NSString *scoreStreak3Name;
@property (nonatomic, strong) NSString *wildCardScoreStreakName;


@property (nonatomic) NSInteger pointsUsed;

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining;

@end
