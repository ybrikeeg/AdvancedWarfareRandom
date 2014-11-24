//
//  ExoAbility.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExoAbility : NSObject

@property (nonatomic, strong) NSString *exoAbilityName;
@property (nonatomic, strong) NSString *wildCardexoAbilityName;

@property (nonatomic) NSInteger pointsUsed;

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining;

@end
