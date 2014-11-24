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

@interface MainViewController ()
@property (nonatomic) NSInteger pointsRemaining;
@property (nonatomic, strong) NSMutableArray *modularPartsUsed;
@property (nonatomic, strong) Primary *primary;
@property (nonatomic, strong) Secondary *secondary;
@property (nonatomic, strong) Perks *perks;
@property (nonatomic, strong) Scorestreaks *scorestreak;
@property (nonatomic, strong) ExoAbility *exoability;
@property (nonatomic, strong) ExoLauncher *exolauncher;
@end

@implementation MainViewController


- (void)viewDidLoad {
   
   self.modularPartsUsed = [[NSMutableArray alloc] init];
   [super viewDidLoad];
   // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)createClass:(id)sender {
   NSLog(@"Create a class");
   self.pointsRemaining = 13;
   [self.modularPartsUsed removeAllObjects];
   //pick 1 random starting point
   
   while (self.pointsRemaining != 0){
      while ([self.modularPartsUsed count] < 6){
         int modularIndex = [self pickModularIndex];
         if (modularIndex == 0){
            self.primary = [[Primary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.primary.pointsUsed;
         } else if (modularIndex == 1){
            self.secondary = [[Secondary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.secondary.pointsUsed;
            
         } else if (modularIndex == 2){
            self.perks = [[Perks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.perks.pointsUsed;
            
         } else if (modularIndex == 3){
            self.scorestreak = [[Scorestreaks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.scorestreak.pointsUsed;
            
         } else if (modularIndex == 4){
            self.exoability = [[ExoAbility alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.exoability.pointsUsed;
            
         } else if (modularIndex == 5){
            self.exolauncher = [[ExoLauncher alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - self.exolauncher.pointsUsed;
         }
      }
      
      if (self.pointsRemaining != 0){
         self.pointsRemaining = 13;
         [self.modularPartsUsed removeAllObjects];
      }
      
   }
   
   NSLog(@"Primary: %@", self.primary.primaryName);
   NSLog(@"Secondary: %@", self.secondary.secondaryName);
   NSLog(@"Perk 1: %@ \tWildCard: %@", self.perks.perk1Name, self.perks.wildCardPerk1Name);
   NSLog(@"Perk 2: %@ \tWildCard: %@", self.perks.perk2Name, self.perks.wildCardPerk2Name);
   NSLog(@"Perk 3: %@ \tWildCard: %@", self.perks.perk3Name, self.perks.wildCardPerk3Name);
   NSLog(@"Scorestreaks: %@", self.scorestreak.streakArrayStrings);
   NSLog(@"Exoability: %@", self.exoability.exoAbilityArrayStrings);
   NSLog(@"Exolauncher: %@", self.exolauncher.exolauncherArrayStrings);
   
   NSLog(@"final points remaining: %ld\n\n", (long)self.pointsRemaining);
   
   
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
