//
//  DisplayCase.h
//  AWRandom
//
//  Created by Kirby Gee on 11/25/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Primary.h"
#import "Secondary.h"
#import "Perks.h"
#import "Scorestreaks.h"
#import "ExoAbility.h"
#import "ExoLauncher.h"
@interface DisplayCase : UIView <UIPageViewControllerDataSource>



- (void)updateUIWithPrimary:(Primary *)primary withSecondary:(Secondary *)secondary withPerks:(Perks *)perks withScorestreak:(Scorestreaks *)scorestreak withExoability:(ExoAbility *)exoability withExolauncher:(ExoLauncher *)exolauncher withWildcards:(NSMutableArray *)wildcardNames;

@end
