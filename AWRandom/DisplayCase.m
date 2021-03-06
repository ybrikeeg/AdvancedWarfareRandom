//
//  DisplayCase.m
//  AWRandom
//
//  Created by Kirby Gee on 11/25/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "DisplayCase.h"
#import "PageViewController.h"

#define EDGE_OFFSET 10
#define WIDTH (self.frame.size.width - (2*EDGE_OFFSET))
#define PAGECONTROL_HEIGHT 200

@interface DisplayCase ()
@property (nonatomic, strong) UIView *primaryShell;
@property (nonatomic, strong) UIImageView *primaryImage;
@property (nonatomic, strong) UILabel *primaryLabel;
@property (nonatomic, strong) UIView *primaryAttachmentShell;
@property (nonatomic, strong) UIImageView *primaryAttachmentView1;
@property (nonatomic, strong) UIImageView *primaryAttachmentView2;
@property (nonatomic, strong) UIImageView *primaryAttachmentView3;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel1;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel2;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel3;

@property (nonatomic, strong) UIView *secondaryShell;
@property (nonatomic, strong) UIImageView *secondaryImage;
@property (nonatomic, strong) UILabel *secondaryLabel;
@property (nonatomic, strong) UIView *secondaryAttachmentShell;
@property (nonatomic, strong) UIImageView *secondaryAttachmentView1;
@property (nonatomic, strong) UIImageView *secondaryAttachmentView2;
@property (nonatomic, strong) UILabel *secondaryAttachmentLabel1;
@property (nonatomic, strong) UILabel *secondaryAttachmentLabel2;

@property (nonatomic, strong) UIView *perkShell;
@property (nonatomic, strong) UIView *perk1Shell;
@property (nonatomic, strong) UIView *perk2Shell;
@property (nonatomic, strong) UIView *perk3Shell;
@property (nonatomic, strong) UILabel *perk1Label;
@property (nonatomic, strong) UILabel *perk1WildcardLabel;
@property (nonatomic, strong) UILabel *perk2Label;
@property (nonatomic, strong) UILabel *perk2WildcardLabel;
@property (nonatomic, strong) UILabel *perk3Label;
@property (nonatomic, strong) UILabel *perk3WildcardLabel;
@property (nonatomic, strong) UIImageView *perk1Image;
@property (nonatomic, strong) UIImageView *perk1WildcardImage;
@property (nonatomic, strong) UIImageView *perk2Image;
@property (nonatomic, strong) UIImageView *perk2WildcardImage;
@property (nonatomic, strong) UIImageView *perk3Image;
@property (nonatomic, strong) UIImageView *perk3WildcardImage;

@property (nonatomic, strong) UIView *scorestreakShell;
@property (nonatomic, strong) UILabel *streak1title;
@property (nonatomic, strong) UILabel *streak1Name;
@property (nonatomic, strong) UIImageView *streak1Image;
@property (nonatomic, strong) UILabel *streak2title;
@property (nonatomic, strong) UILabel *streak2Name;
@property (nonatomic, strong) UIImageView *streak2Image;
@property (nonatomic, strong) UILabel *streak3title;
@property (nonatomic, strong) UILabel *streak3Name;
@property (nonatomic, strong) UIImageView *streak3Image;
@property (nonatomic, strong) UILabel *streak4title;
@property (nonatomic, strong) UILabel *streak4Name;
@property (nonatomic, strong) UIImageView *streak4Image;

@property (nonatomic, strong) UIView *exoshell;
@property (nonatomic, strong) UILabel *exoabilityTitle;
@property (nonatomic, strong) UILabel *exoabilityName1;
@property (nonatomic, strong) UILabel *exoabilityName2;
@property (nonatomic, strong) UIImageView *exoabilityImage1;
@property (nonatomic, strong) UIImageView *exoabilityImage2;

@property (nonatomic, strong) UILabel *exolauncherTitle;
@property (nonatomic, strong) UILabel *exolauncherName1;
@property (nonatomic, strong) UILabel *exolauncherName2;
@property (nonatomic, strong) UIImageView *exolauncherImage1;
@property (nonatomic, strong) UIImageView *exolauncherImage2;


@property (nonatomic, strong) UIView *wildSehell;
@property (nonatomic, strong) UILabel *wild1Title;
@property (nonatomic, strong) UILabel *wild1Name;
@property (nonatomic, strong) UIImageView *wild1Image;
@property (nonatomic, strong) UILabel *wild2Title;
@property (nonatomic, strong) UILabel *wild2Name;
@property (nonatomic, strong) UIImageView *wild2Image;
@property (nonatomic, strong) UILabel *wild3Title;
@property (nonatomic, strong) UILabel *wild3Name;
@property (nonatomic, strong) UIImageView *wild3Image;

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSMutableArray *vcs;
@end

@implementation DisplayCase

#define BUTTON_HIEGHT 30
- (instancetype)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
   if (self) {
      
      NSInteger usablePixels = self.frame.size.height - 50 - BUTTON_HIEGHT - EDGE_OFFSET * 4;
      
      self.primaryShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, EDGE_OFFSET, WIDTH, usablePixels * .4)];
      [self addSubview: self.primaryShell];
      self.primaryShell.backgroundColor = [UIColor whiteColor];
      
      self.secondaryShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryShell.frame.origin.y + self.primaryShell.frame.size.height + EDGE_OFFSET, WIDTH, usablePixels * .25)];
      [self addSubview: self.secondaryShell];
      self.secondaryShell.backgroundColor = [UIColor whiteColor];
      
      
      [self layoutPrimary];
      [self layoutSecondary];
      
      
      self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
      [[self.pageController view] setFrame:CGRectMake(EDGE_OFFSET, self.secondaryShell.frame.origin.y + self.secondaryShell.frame.size.height + EDGE_OFFSET, WIDTH, usablePixels * .35)];
      
      
      self.vcs = [[NSMutableArray alloc] init];
      for (int i = 0; i < 4; i++){
         PageViewController *page = [[PageViewController alloc] initWithIndex:i];
         page.view = [self createViewForIndex:i];
         [self.vcs addObject:page];
      }
      
      NSArray *viewControllers = [NSArray arrayWithObject:[self.vcs objectAtIndex:0]];
      [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
      
      self.pageController.dataSource = self;
      self.pageController.view.layer.borderWidth = 2.0f;
      self.pageController.view.layer.borderColor = [UIColor grayColor].CGColor;
      [self addSubview:[self.pageController view]];
   }
   
   return self;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
   return 4;
}

- (void)updateUIWithPrimary:(Primary *)primary withSecondary:(Secondary *)secondary withPerks:(Perks *)perks withScorestreak:(Scorestreaks *)scorestreak withExoability:(ExoAbility *)exoability withExolauncher:(ExoLauncher *)exolauncher withWildcards:(NSMutableArray *)wildcardNames{
   
   self.primaryLabel.text = primary.primaryName;
   [self.primaryImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [primary.primaryName.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"_"]]]];
   
   self.primaryAttachmentLabel1.text = [primary.attachments.attachmentList objectAtIndex:0];
   self.primaryAttachmentLabel2.text = [primary.attachments.attachmentList objectAtIndex:1];
   self.primaryAttachmentLabel3.text = [primary.attachments.attachmentList objectAtIndex:2];
   
   [self.primaryAttachmentView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.primaryAttachmentLabel1.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.primaryAttachmentView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.primaryAttachmentLabel2.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.primaryAttachmentView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.primaryAttachmentLabel3.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   self.secondaryLabel.text = secondary.secondaryName;
   
   [self.secondaryImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [secondary.secondaryName.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"_"]]]];
   
   
   self.secondaryAttachmentLabel1.text = [secondary.attachments.attachmentList objectAtIndex:0];
   self.secondaryAttachmentLabel2.text = [secondary.attachments.attachmentList objectAtIndex:1];
   
   [self.secondaryAttachmentView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.secondaryAttachmentLabel1.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.secondaryAttachmentView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.secondaryAttachmentLabel2.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   self.perk1Label.text = perks.perk1Name;
   self.perk1WildcardLabel.text = perks.wildCardPerk1Name;
   [self.perk1Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.perk1Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.perk1WildcardImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.wildCardPerk1Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   self.perk2Label.text = perks.perk2Name;
   self.perk2WildcardLabel.text = perks.wildCardPerk2Name;
   [self.perk2Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.perk2Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.perk2WildcardImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.wildCardPerk2Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   self.perk3Label.text = perks.perk3Name;
   self.perk3WildcardLabel.text = perks.wildCardPerk3Name;
   [self.perk3Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.perk3Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.perk3WildcardImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [perks.wildCardPerk3Name.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   
   self.streak1Name.text = [scorestreak.streakArrayStrings objectAtIndex:0];
   self.streak2Name.text = [scorestreak.streakArrayStrings objectAtIndex:1];
   self.streak3Name.text = [scorestreak.streakArrayStrings objectAtIndex:2];
   self.streak4Name.text = [scorestreak.streakArrayStrings objectAtIndex:3];
   
   [self.streak1Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.streak1Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.streak2Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.streak2Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.streak3Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.streak3Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.streak4Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.streak4Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   self.exoabilityName1.text = [exoability.exoAbilityArrayStrings objectAtIndex:0];
   self.exoabilityName2.text = [exoability.exoAbilityArrayStrings objectAtIndex:1];
   
   NSLog(@"%@ and %@", [self.exoabilityName1.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"], [self.exoabilityName2.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
   [self.exoabilityImage1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.exoabilityName1.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.exoabilityImage2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.exoabilityName2.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   self.exolauncherName1.text = [exolauncher.exolauncherArrayStrings objectAtIndex:0];
   self.exolauncherName2.text = [exolauncher.exolauncherArrayStrings objectAtIndex:1];
   
   [self.exolauncherImage1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.exolauncherName1.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.exolauncherImage2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.exolauncherName2.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
   
   self.wild1Name.text = [wildcardNames objectAtIndex:0];
   self.wild2Name.text = [wildcardNames objectAtIndex:1];
   self.wild3Name.text = [wildcardNames objectAtIndex:2];
   
   [self.wild1Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.wild1Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.wild2Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.wild2Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   [self.wild3Image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [self.wild3Name.text.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@"-"]]]];
   
}




- (UIView *)createViewForIndex:(int)index{
   if (index == 0){
      [self layoutPerks];
      return self.perkShell;
   }else if (index == 1){
      [self layoutScorestreaks];
      return self.scorestreakShell;
   }else if (index == 2){
      [self layoutExo];
      return self.exoshell;
   }else if (index == 3){
      [self layoutWildcards];
      return self.wildSehell;
   }
   
   return NULL;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
   NSUInteger index = [(PageViewController *)viewController index];
   NSLog(@"vc: %lu", (unsigned long)index);
   if (index == 0) {
      return nil;
   }
   
   // Decrease the index by 1 to return
   index--;
   
   return [self.vcs objectAtIndex:index];
   
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
   NSUInteger index = [(PageViewController *)viewController index];
   NSLog(@"vc: %lu", (unsigned long)index);
   
   index++;
   
   if (index == 4) {
      return nil;
   }
   
   return [self.vcs objectAtIndex:index];
}


- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
   // The selected item reflected in the page indicator.
   return 0;
}
- (void)layoutWildcards{
   self.wildSehell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pageController.view.frame.size.width, self.pageController.view.frame.size.height - 36)];
   self.wildSehell.backgroundColor = [UIColor whiteColor];
   
   self.wild1Title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, WIDTH/3 - EDGE_OFFSET, 30)];
   self.wild1Title.text = @"Wildcard 1";
   self.wild1Title.adjustsFontSizeToFitWidth = YES;
   [self.wild1Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.wildSehell addSubview:self.wild1Title];
   
   self.wild1Name = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.wild1Title.frame.origin.y + self.wild1Title.frame.size.height, WIDTH/3 - EDGE_OFFSET, 20)];
   self.wild1Name.text = @"Wildcard 1 name";
   self.wild1Name.adjustsFontSizeToFitWidth = YES;
   [self.wild1Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.wildSehell addSubview:self.wild1Name];
   
   NSInteger sideLength = self.wildSehell.frame.size.height - (self.wild1Name.frame.origin.y + self.wild1Name.frame.size.height);
   
   self.wild1Image = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH/3 - sideLength)/2, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.wildSehell addSubview:self.wild1Image];
   
   
   self.wild2Title = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/3 + EDGE_OFFSET, 0, WIDTH/3 - EDGE_OFFSET, 30)];
   self.wild2Title.text = @"Wildcard 2";
   self.wild2Title.adjustsFontSizeToFitWidth = YES;
   [self.wild2Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.wildSehell addSubview:self.wild2Title];
   
   self.wild2Name = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/3 + EDGE_OFFSET, self.wild2Title.frame.origin.y + self.wild2Title.frame.size.height, WIDTH/3 - EDGE_OFFSET, 20)];
   self.wild2Name.text = @"Wildcard 2 name";
   self.wild2Name.adjustsFontSizeToFitWidth = YES;
   [self.wild2Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.wildSehell addSubview:self.wild2Name];
   
   
   
   self.wild2Image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/3 + (WIDTH/3 - sideLength)/2, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.wildSehell addSubview:self.wild2Image];
   
   
   self.wild3Title = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/3 + EDGE_OFFSET, 0, WIDTH/3 - EDGE_OFFSET, 30)];
   self.wild3Title.text = @"Wildcard 3";
   self.wild3Title.adjustsFontSizeToFitWidth = YES;
   [self.wild3Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.wildSehell addSubview:self.wild3Title];
   
   self.wild3Name = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/3 + EDGE_OFFSET, self.wild3Title.frame.origin.y + self.wild3Title.frame.size.height, WIDTH/3 - EDGE_OFFSET, 20)];
   self.wild3Name.text = @"Wildcard 3 name";
   self.wild3Name.adjustsFontSizeToFitWidth = YES;
   [self.wild3Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.wildSehell addSubview:self.wild3Name];
   
   self.wild3Image = [[UIImageView alloc] initWithFrame:CGRectMake(2 * WIDTH/3 + (WIDTH/3 - sideLength)/3, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.wildSehell addSubview:self.wild3Image];
   
}

- (void)layoutExo{
   self.exoshell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pageController.view.frame.size.width, self.pageController.view.frame.size.height - 36)];
   self.exoshell.backgroundColor = [UIColor whiteColor];
   
   
   self.exoabilityTitle = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, WIDTH/2, 30)];
   self.exoabilityTitle.text = @"Exoability";
   self.exoabilityTitle.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.exoshell addSubview:self.exoabilityTitle];
   
   self.exoabilityName1 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.exoabilityTitle.frame.origin.y + self.exoabilityTitle.frame.size.height, WIDTH/2 - EDGE_OFFSET, 20)];
   self.exoabilityName1.text = @"Exoability 1";
   self.exoabilityName1.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityName1 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.exoshell addSubview:self.exoabilityName1];
   
   self.exoabilityName2 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.exoabilityName1.frame.origin.y + self.exoabilityName1.frame.size.height, WIDTH/2 - EDGE_OFFSET, 20)];
   self.exoabilityName2.text = @"Exoability 2";
   self.exoabilityName2.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityName2 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.exoshell addSubview:self.exoabilityName2];
   
   NSInteger sideLength = (self.exoshell.frame.size.height - (self.exoabilityName2.frame.origin.y + self.exoabilityName2.frame.size.height));
   
   self.exoabilityImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.exoshell addSubview:self.exoabilityImage1];
   
   self.exoabilityImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(sideLength, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.exoshell addSubview:self.exoabilityImage2];
   
   self.exolauncherTitle = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + WIDTH/2, 0, WIDTH/2 - EDGE_OFFSET, 30)];
   self.exolauncherTitle.text = @"Exolauncher";
   self.exolauncherTitle.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.exoshell addSubview:self.exolauncherTitle];
   
   self.exolauncherName1 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + WIDTH/2, self.exolauncherTitle.frame.origin.y + self.exolauncherTitle.frame.size.height, WIDTH/2 - EDGE_OFFSET, 20)];
   self.exolauncherName1.text = @"Exolauncher 1";
   self.exolauncherName1.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherName1 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.exoshell addSubview:self.exolauncherName1];
   
   self.exolauncherName2 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + WIDTH/2, self.exolauncherName1.frame.origin.y + self.exolauncherName1.frame.size.height, WIDTH/2 - EDGE_OFFSET, 20)];
   self.exolauncherName2.text = @"Exolauncher 2";
   self.exolauncherName2.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherName2 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.exoshell addSubview:self.exolauncherName2];
   
   self.exolauncherImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.exoshell addSubview:self.exolauncherImage2];
   
   self.exolauncherImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2 + sideLength, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.exoshell addSubview:self.exolauncherImage1];
}

- (void)layoutScorestreaks{
   NSInteger sideLength = WIDTH/4;
   
   self.scorestreakShell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pageController.view.frame.size.width, self.pageController.view.frame.size.height - 36)];
   self.scorestreakShell.backgroundColor = [UIColor whiteColor];
   
   
   self.streak1title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, WIDTH/4 - EDGE_OFFSET, 30)];
   self.streak1title.text = @"Streak 1";
   self.streak1title.adjustsFontSizeToFitWidth = YES;
   [self.streak1title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.scorestreakShell addSubview:self.streak1title];
   
   self.streak1Name = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.streak1title.frame.origin.y + self.streak1title.frame.size.height, WIDTH/4 - EDGE_OFFSET, 20)];
   self.streak1Name.text = @"Streak Name";
   self.streak1Name.adjustsFontSizeToFitWidth = YES;
   [self.streak1Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.scorestreakShell addSubview:self.streak1Name];
   
   self.streak1Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.scorestreakShell addSubview:self.streak1Image];
   
   
   self.streak2title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + WIDTH/4, 0, WIDTH/4 - EDGE_OFFSET, 30)];
   self.streak2title.text = @"Streak 2";
   self.streak2title.adjustsFontSizeToFitWidth = YES;
   [self.streak2title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.scorestreakShell addSubview:self.streak2title];
   
   self.streak2Name = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + WIDTH/4, self.streak2title.frame.origin.y + self.streak2title.frame.size.height, WIDTH/4  - EDGE_OFFSET, 20)];
   self.streak2Name.text = @"Streak Name";
   self.streak2Name.adjustsFontSizeToFitWidth = YES;
   [self.streak2Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.scorestreakShell addSubview:self.streak2Name];
   
   self.streak2Image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.scorestreakShell addSubview:self.streak2Image];
   
   self.streak3title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + 2 * WIDTH/4, 0, WIDTH/4 - EDGE_OFFSET, 30)];
   self.streak3title.text = @"Streak 3";
   self.streak3title.adjustsFontSizeToFitWidth = YES;
   [self.streak3title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.scorestreakShell addSubview:self.streak3title];
   
   self.streak3Name = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + 2 * WIDTH/4, self.streak3title.frame.origin.y + self.streak3title.frame.size.height, WIDTH/4  - EDGE_OFFSET, 20)];
   self.streak3Name.text = @"Streak Name";
   self.streak3Name.adjustsFontSizeToFitWidth = YES;
   [self.streak3Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.scorestreakShell addSubview:self.streak3Name];
   
   self.streak3Image = [[UIImageView alloc] initWithFrame:CGRectMake(2 * WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.scorestreakShell addSubview:self.streak3Image];
   
   self.streak4title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + 3 * WIDTH/4, 0, WIDTH/4 - EDGE_OFFSET, 30)];
   self.streak4title.text = @"Streak 4";
   self.streak4title.adjustsFontSizeToFitWidth = YES;
   [self.streak4title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.scorestreakShell addSubview:self.streak4title];
   
   self.streak4Name = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET + 3 * WIDTH/4, self.streak4title.frame.origin.y + self.streak4title.frame.size.height, WIDTH/4  - EDGE_OFFSET, 20)];
   self.streak4Name.text = @"Streak Name";
   self.streak4Name.adjustsFontSizeToFitWidth = YES;
   [self.streak4Name setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.scorestreakShell addSubview:self.streak4Name];
   
   self.streak4Image = [[UIImageView alloc] initWithFrame:CGRectMake(3 * WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.scorestreakShell addSubview:self.streak4Image];
}

- (void)layoutPerks{
   self.perkShell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.pageController.view.frame.size.width, self.pageController.view.frame.size.height - 75)];
   self.perkShell.backgroundColor = [UIColor whiteColor];
   
   //perk 1
   self.perk1Shell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH/3, self.pageController.view.frame.size.height - 36)];
   //self.perk1Shell.backgroundColor = [UIColor orangeColor];
   [self.perkShell addSubview:self.perk1Shell];
   self.perk1Shell.layer.borderWidth = 2.0f;
   self.perk1Shell.layer.borderColor = [UIColor grayColor].CGColor;
   UILabel *perk1Title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, self.perk1Shell.frame.size.width, 30)];
   perk1Title.text = @"Perk 1";
   perk1Title.adjustsFontSizeToFitWidth = YES;
   [perk1Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:20.0f]];
   [self.perk1Shell addSubview:perk1Title];
   
   self.perk1Label = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, perk1Title.frame.origin.y + perk1Title.frame.size.height, self.perk1Shell.frame.size.width, 20)];
   self.perk1Label.text = @"Perk 1 Name";
   self.perk1Label.adjustsFontSizeToFitWidth = YES;
   [self.perk1Label setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk1Shell addSubview:self.perk1Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk1Label.frame));
   
   self.perk1WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.perk1Label.frame.origin.y + self.perk1Label.frame.size.height, self.perk1Shell.frame.size.width, 20)];
   self.perk1WildcardLabel.text = @"Perk 1 Wild";
   self.perk1WildcardLabel.adjustsFontSizeToFitWidth = YES;
   [self.perk1WildcardLabel setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk1Shell addSubview:self.perk1WildcardLabel];
   
   NSInteger sideLength = self.perk1Shell.frame.size.width/2;
   
   self.perk1Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.perk1Shell.frame.size.height - sideLength, sideLength,sideLength)];
   [self.perk1Shell addSubview:self.perk1Image];
   
   self.perk1WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake(sideLength, self.perk1Shell.frame.size.height - sideLength, sideLength,sideLength)];
   [self.perk1Shell addSubview:self.perk1WildcardImage];
   
   
   self.perk2Shell = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, self.pageController.view.frame.size.height - 36)];
   [self.perkShell addSubview:self.perk2Shell];

   UILabel *perk2Title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, self.perk2Shell.frame.size.width, 30)];
   perk2Title.text = @"Perk 2";
   perk2Title.adjustsFontSizeToFitWidth = YES;
   [perk2Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:20.0f]];
   [self.perk2Shell addSubview:perk2Title];
   
   self.perk2Label = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, perk2Title.frame.origin.y + perk2Title.frame.size.height, self.perk2Shell.frame.size.width, 20)];
   self.perk2Label.text = @"Perk 2 Name";
   self.perk2Label.adjustsFontSizeToFitWidth = YES;
   [self.perk2Label setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk2Shell addSubview:self.perk2Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk2Label.frame));
   
   self.perk2WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.perk2Label.frame.origin.y + self.perk2Label.frame.size.height, self.perk2Shell.frame.size.width, 20)];
   self.perk2WildcardLabel.text = @"Perk 2 Wild";
   self.perk2WildcardLabel.adjustsFontSizeToFitWidth = YES;
   [self.perk2WildcardLabel setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk2Shell addSubview:self.perk2WildcardLabel];
   
   self.perk2Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.perk2Shell.frame.size.height - sideLength, sideLength,sideLength)];
   [self.perk2Shell addSubview:self.perk2Image];
   
   self.perk2WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake(sideLength, self.perk2Shell.frame.size.height - sideLength, sideLength,sideLength)];
   [self.perk2Shell addSubview:self.perk2WildcardImage];
   
   
   self.perk3Shell = [[UIView alloc] initWithFrame:CGRectMake(2 * WIDTH/3, 0, WIDTH/3, self.pageController.view.frame.size.height - 36)];
   [self.perkShell addSubview:self.perk3Shell];
   self.perk3Shell.layer.borderWidth = 2.0f;
   self.perk3Shell.layer.borderColor = [UIColor grayColor].CGColor;
   
   UILabel *perk3Title = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, self.perk3Shell.frame.size.width, 30)];
   perk3Title.text = @"Perk 3";
   perk3Title.adjustsFontSizeToFitWidth = YES;
   [perk3Title setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:20.0f]];
   [self.perk3Shell addSubview:perk3Title];
   
   self.perk3Label = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, perk3Title.frame.origin.y + perk3Title.frame.size.height, self.perk3Shell.frame.size.width, 20)];
   self.perk3Label.text = @"Perk 3 Name";
   self.perk3Label.adjustsFontSizeToFitWidth = YES;
   [self.perk3Label setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk3Shell addSubview:self.perk3Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk3Label.frame));
   
   self.perk3WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.perk3Label.frame.origin.y + self.perk3Label.frame.size.height, self.perk3Shell.frame.size.width, 20)];
   self.perk3WildcardLabel.text = @"Perk 3 Wild";
   self.perk3WildcardLabel.adjustsFontSizeToFitWidth = YES;
   [self.perk3WildcardLabel setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:14.0f]];
   [self.perk3Shell addSubview:self.perk3WildcardLabel];
   
   
   self.perk3Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.perk3Shell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.perk3Shell addSubview:self.perk3Image];
   
   self.perk3WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake(sideLength, self.perk3Shell.frame.size.height - sideLength, sideLength, sideLength)];
   [self.perk3Shell addSubview:self.perk3WildcardImage];
   
}

- (void)layoutSecondary{
   
   int shellHeight = self.secondaryShell.frame.size.height;
   self.secondaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, shellHeight * .75)];
   [self.secondaryShell addSubview:self.secondaryImage];
   
   self.secondaryShell.layer.borderWidth = 2.0f;
   self.secondaryShell.layer.borderColor = [UIColor grayColor].CGColor;
   
   self.secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.secondaryImage.frame.origin.y + self.secondaryImage.frame.size.height - 35, self.secondaryImage.frame.size.width, 40)];
   self.secondaryLabel.text = @"Secondary Gun";
   [self.secondaryLabel setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:20.0f]];
   self.secondaryLabel.textColor = [UIColor lightGrayColor];
   [self.secondaryShell addSubview:self.secondaryLabel];
   
   self.secondaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(0, self.secondaryImage.frame.origin.y + self.secondaryImage.frame.size.height, WIDTH, shellHeight * .25)];
   [self.secondaryShell addSubview:self.secondaryAttachmentShell];
   
   self.secondaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel1.text = @"Attachment 1";
   self.secondaryAttachmentLabel1.adjustsFontSizeToFitWidth = YES;
   [self.secondaryAttachmentLabel1 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13.0f]];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel1];
   
   self.secondaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.secondaryAttachmentShell.frame.size.height/2, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel2.text = @"Attachment 2";
   self.secondaryAttachmentLabel2.adjustsFontSizeToFitWidth = YES;
   [self.secondaryAttachmentLabel2 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13.0f]];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel2];
   
   NSInteger attachWidth = self.secondaryAttachmentShell.frame.size.height;
   self.secondaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView1];
   
   self.secondaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView2];
   
   
}
- (void)layoutPrimary{
   
   int shellHeight = self.primaryShell.frame.size.height;
   
   //add image
   self.primaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, shellHeight * .75)];
   [self.primaryShell addSubview:self.primaryImage];
   self.primaryShell.layer.borderWidth = 2.0f;
   self.primaryShell.layer.borderColor = [UIColor grayColor].CGColor;
   
   //add label
   self.primaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryImage.frame.origin.y + self.primaryImage.frame.size.height - 35, self.primaryImage.frame.size.height, 40)];
   self.primaryLabel.text = @"Primary Gun";
   self.primaryLabel.textColor = [UIColor lightGrayColor];
   self.primaryLabel.adjustsFontSizeToFitWidth = YES;
   [self.primaryLabel setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:22.0f]];
   [self.primaryShell addSubview:self.primaryLabel];
   
   //add shell
   self.primaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(0, self.primaryImage.frame.origin.y + self.primaryImage.frame.size.height, WIDTH, shellHeight * .25)];
   [self.primaryShell addSubview:self.primaryAttachmentShell];
   
   self.primaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, 0, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel1.text = @"Attachment 1";
   self.primaryAttachmentLabel1.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel1 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13.0f]];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel1];
   
   self.primaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryAttachmentShell.frame.size.height/3, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel2.text = @"Attachment 2";
   self.primaryAttachmentLabel2.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel2 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13.0f]];   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel2];
   
   self.primaryAttachmentLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryAttachmentShell.frame.size.height/3 * 2, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel3.text = @"Attachment 3";
   self.primaryAttachmentLabel3.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel3 setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13.0f]];   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel2];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel3];
   
   NSInteger attachWidth = self.primaryAttachmentShell.frame.size.height;
   self.primaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView1];
   
   self.primaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView2];
   
   self.primaryAttachmentView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 3, 0, attachWidth, attachWidth)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView3];
   
}

@end
