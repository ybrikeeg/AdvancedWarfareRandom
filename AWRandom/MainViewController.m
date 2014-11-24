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
            NSLog(@"primary");
            Primary *primary = [[Primary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - primary.pointsUsed;
         } else if (modularIndex == 1){
            NSLog(@"secondary");
            Secondary *secondary = [[Secondary alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - secondary.pointsUsed;
            
         } else if (modularIndex == 2){
            NSLog(@"perk");
            Perks *perks = [[Perks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - perks.pointsUsed;
            
         } else if (modularIndex == 3){
            NSLog(@"scorestreak");
            Scorestreaks *scorestreak = [[Scorestreaks alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - scorestreak.pointsUsed;
            
         } else if (modularIndex == 4){
            NSLog(@"exoability");
            ExoAbility *exoability = [[ExoAbility alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - exoability.pointsUsed;
            
         } else if (modularIndex == 5){
            NSLog(@"exolauncher");
            ExoLauncher *exolauncher = [[ExoLauncher alloc] initWithPointsRemaining:self.pointsRemaining];
            self.pointsRemaining = self.pointsRemaining - exolauncher.pointsUsed;
         }
      }
      NSLog(@"points remaining: %ld\n", (long)self.pointsRemaining);
      if (self.pointsRemaining != 0){
         self.pointsRemaining = 13;
         [self.modularPartsUsed removeAllObjects];
      }

   }
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
