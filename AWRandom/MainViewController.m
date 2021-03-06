//
//  ViewController.m
//  AWRandom
//
//  Created by Kirby Gee on 11/23/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "MainViewController.h"
#import "Primary.h"
#import "Secondary.h"
#import "Perks.h"
#import "Scorestreaks.h"
#import "ExoAbility.h"
#import "ExoLauncher.h"
#import "DisplayCase.h"
#import "iAd/ADBannerView.h"


@interface MainViewController ()
@property (nonatomic) NSInteger pointsRemaining;
@property (nonatomic, strong) NSMutableArray *modularPartsUsed;
@property (nonatomic, strong) Primary *primary;
@property (nonatomic, strong) Secondary *secondary;
@property (nonatomic, strong) Perks *perks;
@property (nonatomic, strong) Scorestreaks *scorestreak;
@property (nonatomic, strong) ExoAbility *exoability;
@property (nonatomic, strong) ExoLauncher *exolauncher;
@property (nonatomic, strong) NSMutableArray *wildcardNames;
@property (nonatomic, strong) DisplayCase *display;
@end

@implementation MainViewController


- (void)viewDidLoad {
   self.modularPartsUsed = [[NSMutableArray alloc] init];
   self.wildcardNames = [[NSMutableArray alloc] init];

   self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];

   self.display = [[DisplayCase alloc] initWithFrame:self.view.frame];
   [self.view addSubview:self.display];
   
   
   ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
   [self.view addSubview:adView];
   
   UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   [button addTarget:self action:@selector(createClass:)
    forControlEvents:UIControlEventTouchUpInside];
   button.frame = CGRectMake(50, adView.frame.origin.y - 40, self.view.frame.size.width - 50*2, 40);
   UIImage *press = [UIImage imageNamed:@"Button"];
   [button setImage:press forState:UIControlStateNormal];
   
   [self.view addSubview:button];
   
   [super viewDidLoad];
}

- (void)createClass:(UIButton *)sender{

   NSLog(@"Create a class");
   self.pointsRemaining = 13;
   [self.modularPartsUsed removeAllObjects];
   [self.wildcardNames removeAllObjects];
   //pick 1 random starting point
   
   while (self.pointsRemaining != 0){
      while ([self.modularPartsUsed count] < 6){
         int modularIndex = [self pickModularIndex];
         if (modularIndex == 0){
            self.primary = [[Primary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.primary.pointsUsed;
            if (self.primary.pointsUsed == 5){
               [self.wildcardNames addObject:@"Primary Gunfighter"];
            }
         } else if (modularIndex == 1){
            self.secondary = [[Secondary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.secondary.pointsUsed;
            if (self.secondary.pointsUsed == 4){
               [self.wildcardNames addObject:@"Secondary Gunfighter"];
            }
         } else if (modularIndex == 2){
            self.perks = [[Perks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.perks.pointsUsed;
            if ([self.perks.wildCardPerk1Name length] > 0){
               [self.wildcardNames addObject:@"Perk 1 Greed"];
            }
            if ([self.perks.wildCardPerk2Name length] > 0){
               [self.wildcardNames addObject:@"Perk 2 Greed"];
            }
            if ([self.perks.wildCardPerk3Name length] > 0){
               [self.wildcardNames addObject:@"Perk 3 Greed"];
            }
         } else if (modularIndex == 3){
            self.scorestreak = [[Scorestreaks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.scorestreak.pointsUsed;
            if (self.scorestreak.pointsUsed == 5){
               [self.wildcardNames addObject:@"Streaker"];
            }
         } else if (modularIndex == 4){
            self.exoability = [[ExoAbility alloc] initWithPointsRemaining:self.pointsRemaining wildcardDisabled:[self.wildcardNames containsObject:@"Bombardier"]];
            self.pointsRemaining = self.pointsRemaining - self.exoability.pointsUsed;
            if (self.exoability.pointsUsed == 3){
               [self.wildcardNames addObject:@"Tactician"];
            }
         } else if (modularIndex == 5){
            self.exolauncher = [[ExoLauncher alloc] initWithPointsRemaining:self.pointsRemaining wildcardDisabled:[self.wildcardNames containsObject:@"Tactician"]];
            self.pointsRemaining = self.pointsRemaining - self.exolauncher.pointsUsed;
            if (self.exolauncher.pointsUsed == 3){
               [self.wildcardNames addObject:@"Bombardier"];
            }
         }
      }
      
      bool exo1 = (self.exoability.pointsUsed == 3 && self.exolauncher.pointsUsed > 0);
      bool exo2 = (self.exoability.pointsUsed > 0 && self.exolauncher.pointsUsed == 3);

      if (self.pointsRemaining != 0 || exo1 || exo2){
         self.pointsRemaining = 13;
         [self.modularPartsUsed removeAllObjects];
         [self.wildcardNames removeAllObjects];
      }
      
   }

   [self.wildcardNames sortUsingSelector:@selector(caseInsensitiveCompare:)];
   for (int i = [self.wildcardNames count]; i < 3; i++){
      [self.wildcardNames addObject:@""];
   }
   
   [self.display updateUIWithPrimary:self.primary withSecondary:self.secondary withPerks:self.perks withScorestreak:self.scorestreak withExoability:self.exoability withExolauncher:self.exolauncher withWildcards: self.wildcardNames];
   
   NSLog(@"Primary: %@", self.primary.primaryName);
   NSLog(@"Primary attach: %@", self.primary.attachments.attachmentList);
   NSLog(@"Secondary: %@", self.secondary.secondaryName);
   NSLog(@"Secondary attach: %@", self.secondary.attachments.attachmentList);

   NSLog(@"Perk 1: %@ \tWildCard: %@", self.perks.perk1Name, self.perks.wildCardPerk1Name);
   NSLog(@"Perk 2: %@ \tWildCard: %@", self.perks.perk2Name, self.perks.wildCardPerk2Name);
   NSLog(@"Perk 3: %@ \tWildCard: %@", self.perks.perk3Name, self.perks.wildCardPerk3Name);
   NSLog(@"Scorestreaks: %@", self.scorestreak.streakArrayStrings);
   NSLog(@"Exoability: %@", self.exoability.exoAbilityArrayStrings);
   NSLog(@"Exolauncher: %@", self.exolauncher.exolauncherArrayStrings);
   NSLog(@"WIldcardss: %@", self.wildcardNames);
   
   NSLog(@"final points remaining: %ld\n\n\n\n\n", (long)self.pointsRemaining);
}

- (int)pickModularIndex{
   int modularIndex = arc4random()%6;
   while ([self.modularPartsUsed containsObject:[NSNumber numberWithInt:modularIndex]]){
      modularIndex = arc4random()%6;
   }
   [self.modularPartsUsed addObject:[NSNumber numberWithInt:modularIndex]];
   return modularIndex;
}
- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

@end
