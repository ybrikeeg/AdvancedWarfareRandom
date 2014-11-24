//
//  Perks.h
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "constants.h"
@interface Perks : NSObject

@property (nonatomic, strong) NSString *perk1Name;
@property (nonatomic, strong) NSString *wildCardPerk1Name;

@property (nonatomic, strong) NSString *perk2Name;
@property (nonatomic, strong) NSString *wildCardPerk2Name;

@property (nonatomic, strong) NSString *perk3Name;
@property (nonatomic, strong) NSString *wildCardPerk3Name;


@property (nonatomic) NSInteger pointsUsed;

- (instancetype)initWithPointsRemaining:(NSInteger)pointsRemaining;

@end
