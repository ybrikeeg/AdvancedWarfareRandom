//
//  DisplayCase.m
//  AWRandom
//
//  Created by Kirby Gee on 11/25/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "DisplayCase.h"

#define EDGE_OFFSET 10
#define WIDTH (self.frame.size.width - (2*EDGE_OFFSET))
#define PAGECONTROL_HEIGHT 200

@interface DisplayCase ()
@property (nonatomic, strong) UIImageView *primaryImage;
@property (nonatomic, strong) UILabel *primaryLabel;
@property (nonatomic, strong) UIView *primaryAttachmentShell;
@property (nonatomic, strong) UIImageView *primaryAttachmentView1;
@property (nonatomic, strong) UIImageView *primaryAttachmentView2;
@property (nonatomic, strong) UIImageView *primaryAttachmentView3;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel1;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel2;
@property (nonatomic, strong) UILabel *primaryAttachmentLabel3;

@property (nonatomic, strong) UIImageView *secondaryImage;
@property (nonatomic, strong) UILabel *secondaryLabel;
@property (nonatomic, strong) UIView *secondaryAttachmentShell;
@property (nonatomic, strong) UIImageView *secondaryAttachmentView1;
@property (nonatomic, strong) UIImageView *secondaryAttachmentView2;
@property (nonatomic, strong) UILabel *secondaryAttachmentLabel1;
@property (nonatomic, strong) UILabel *secondaryAttachmentLabel2;


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
@end

@implementation DisplayCase

- (instancetype)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
   if (self) {
      //[self layoutPrimary];
      //[self layoutSecondary];
      
      //[self layoutPerks];
      //[self layoutScorestreaks];
      //[self layoutExo];
      [self layoutWildcards];
   }
   
   return self;
}

- (void)layoutWildcards{
   self.wildSehell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, PAGECONTROL_HEIGHT)];
   self.wildSehell.backgroundColor = [self randomColor];
   [self addSubview:self.wildSehell];
   
   self.wild1Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH/3, 30)];
   self.wild1Title.text = @"Wildcard 1";
   self.wild1Title.adjustsFontSizeToFitWidth = YES;
   [self.wild1Title sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild1Title];
   
   self.wild1Name = [[UILabel alloc] initWithFrame:CGRectMake(0, self.wild1Title.frame.origin.y + self.wild1Title.frame.size.height, WIDTH/3, 30)];
   self.wild1Name.text = @"Wildcard 1 name";
   self.wild1Name.adjustsFontSizeToFitWidth = YES;
   [self.wild1Name sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild1Name];
   
   NSInteger sideLength = WIDTH/3;
   
   
   self.wild1Image = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH/3 - sideLength)/2, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   self.wild1Image.backgroundColor = [self randomColor];
   [self.wildSehell addSubview:self.wild1Image];
   
   
   self.wild2Title = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, 30)];
   self.wild2Title.text = @"Wildcard 2";
   self.wild2Title.adjustsFontSizeToFitWidth = YES;
   [self.wild2Title sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild2Title];
   
   self.wild2Name = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/3, self.wild2Title.frame.origin.y + self.wild2Title.frame.size.height, WIDTH/3, 30)];
   self.wild2Name.text = @"Wildcard 2 name";
   self.wild2Name.adjustsFontSizeToFitWidth = YES;
   [self.wild2Name sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild2Name];
   
   
   
   self.wild2Image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/3 + (WIDTH/3 - sideLength)/2, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   self.wild2Image.backgroundColor = [self randomColor];
   [self.wildSehell addSubview:self.wild2Image];
   
   
   self.wild3Title = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/3, 0, WIDTH/3, 30)];
   self.wild3Title.text = @"Wildcard 3";
   self.wild3Title.adjustsFontSizeToFitWidth = YES;
   [self.wild3Title sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild3Title];
   
   self.wild3Name = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/3, self.wild3Title.frame.origin.y + self.wild3Title.frame.size.height, WIDTH/3, 30)];
   self.wild3Name.text = @"Wildcard 3 name";
   self.wild3Name.adjustsFontSizeToFitWidth = YES;
   [self.wild3Name sizeThatFits:CGSizeMake(WIDTH/3, 30)];
   [self.wildSehell addSubview:self.wild3Name];
   
   
   
   self.wild3Image = [[UIImageView alloc] initWithFrame:CGRectMake(2 * WIDTH/3 + (WIDTH/3 - sideLength)/3, self.wildSehell.frame.size.height - sideLength, sideLength, sideLength)];
   self.wild3Image.backgroundColor = [self randomColor];
   [self.wildSehell addSubview:self.wild3Image];

}

- (void)layoutExo{
   self.exoshell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, PAGECONTROL_HEIGHT)];
   self.exoshell.backgroundColor = [self randomColor];
   [self addSubview:self.exoshell];
   

   self.exoabilityTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH/2, 30)];
   self.exoabilityTitle.text = @"Exoability";
   self.exoabilityTitle.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityTitle sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exoabilityTitle];
   
   self.exoabilityName1 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.exoabilityTitle.frame.origin.y + self.exoabilityTitle.frame.size.height, WIDTH/2, 30)];
   self.exoabilityName1.text = @"Exoability 1";
   self.exoabilityName1.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityName1 sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exoabilityName1];
   
   self.exoabilityName2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.exoabilityName1.frame.origin.y + self.exoabilityName1.frame.size.height, WIDTH/2, 30)];
   self.exoabilityName2.text = @"Exoability 2";
   self.exoabilityName2.adjustsFontSizeToFitWidth = YES;
   [self.exoabilityName2 sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exoabilityName2];
   
   NSInteger sideLength = (self.exoshell.frame.size.height - (self.exoabilityName2.frame.origin.y + self.exoabilityName2.frame.size.height))/2;

   
   self.exoabilityImage2 = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH/2 - sideLength)/2, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   self.exoabilityImage2.backgroundColor = [self randomColor];
   [self.exoshell addSubview:self.exoabilityImage2];
   
   self.exoabilityImage1 = [[UIImageView alloc] initWithFrame:CGRectMake((WIDTH/2 - sideLength)/2, self.exoabilityImage2.frame.origin.y - sideLength, sideLength, sideLength)];
   self.exoabilityImage1.backgroundColor = [self randomColor];
   [self.exoshell addSubview:self.exoabilityImage1];
   
   
   self.exolauncherTitle = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 30)];
   self.exolauncherTitle.text = @"Exolauncher";
   self.exolauncherTitle.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherTitle sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exolauncherTitle];
   
   self.exolauncherName1 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, self.exolauncherTitle.frame.origin.y + self.exolauncherTitle.frame.size.height, WIDTH/2, 30)];
   self.exolauncherName1.text = @"Exolauncher 1";
   self.exolauncherName1.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherName1 sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exolauncherName1];
   
   self.exolauncherName2 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, self.exolauncherName1.frame.origin.y + self.exolauncherName1.frame.size.height, WIDTH/2, 30)];
   self.exolauncherName2.text = @"Exolauncher 2";
   self.exolauncherName2.adjustsFontSizeToFitWidth = YES;
   [self.exolauncherName2 sizeThatFits:CGSizeMake(WIDTH/2, 30)];
   [self.exoshell addSubview:self.exolauncherName2];
   
   self.exolauncherImage2 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2 + (WIDTH/2 - sideLength)/2, self.exoshell.frame.size.height - sideLength, sideLength, sideLength)];
   self.exolauncherImage2.backgroundColor = [self randomColor];
   [self.exoshell addSubview:self.exolauncherImage2];
   
   self.exolauncherImage1 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2 + (WIDTH/2 - sideLength)/2, self.exolauncherImage2.frame.origin.y - sideLength, sideLength, sideLength)];
   self.exolauncherImage1.backgroundColor = [self randomColor];
   [self.exoshell addSubview:self.exolauncherImage1];
   
}

- (void)layoutScorestreaks{
   NSInteger sideLength = WIDTH/4;

   self.scorestreakShell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, PAGECONTROL_HEIGHT)];
   self.scorestreakShell.backgroundColor = [self randomColor];
   [self addSubview:self.scorestreakShell];
   
   self.streak1title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH/4, 30)];
   self.streak1title.text = @"Streak 1";
   self.streak1title.adjustsFontSizeToFitWidth = YES;
   [self.streak1title sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak1title];
   
   self.streak1Name = [[UILabel alloc] initWithFrame:CGRectMake(0, self.streak1title.frame.origin.y + self.streak1title.frame.size.height, WIDTH/4, 30)];
   self.streak1Name.text = @"Streak Name";
   self.streak1Name.adjustsFontSizeToFitWidth = YES;
   [self.streak1Name sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak1Name];

   self.streak1Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   self.streak1Image.backgroundColor = [self randomColor];
   [self.scorestreakShell addSubview:self.streak1Image];
   
   
   
   self.streak2title = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4, 0, WIDTH/4, 30)];
   self.streak2title.text = @"Streak 2";
   self.streak2title.adjustsFontSizeToFitWidth = YES;
   [self.streak2title sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak2title];
   
   self.streak2Name = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4, self.streak2title.frame.origin.y + self.streak2title.frame.size.height, WIDTH/4, 30)];
   self.streak2Name.text = @"Streak Name";
   self.streak2Name.adjustsFontSizeToFitWidth = YES;
   [self.streak2Name sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak2Name];
   
   self.streak2Image = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   self.streak2Image.backgroundColor = [self randomColor];
   [self.scorestreakShell addSubview:self.streak2Image];
   
   self.streak3title = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/4, 0, WIDTH/4, 30)];
   self.streak3title.text = @"Streak 3";
   self.streak3title.adjustsFontSizeToFitWidth = YES;
   [self.streak3title sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak3title];
   
   self.streak3Name = [[UILabel alloc] initWithFrame:CGRectMake(2 * WIDTH/4, self.streak3title.frame.origin.y + self.streak3title.frame.size.height, WIDTH/4, 30)];
   self.streak3Name.text = @"Streak Name";
   self.streak3Name.adjustsFontSizeToFitWidth = YES;
   [self.streak3Name sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak3Name];
   
   self.streak3Image = [[UIImageView alloc] initWithFrame:CGRectMake(2 * WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   self.streak3Image.backgroundColor = [self randomColor];
   [self.scorestreakShell addSubview:self.streak3Image];
   
   self.streak4title = [[UILabel alloc] initWithFrame:CGRectMake(3 * WIDTH/4, 0, WIDTH/4, 30)];
   self.streak4title.text = @"Streak 4";
   self.streak4title.adjustsFontSizeToFitWidth = YES;
   [self.streak4title sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak4title];
   
   self.streak4Name = [[UILabel alloc] initWithFrame:CGRectMake(3 * WIDTH/4, self.streak4title.frame.origin.y + self.streak4title.frame.size.height, WIDTH/4, 30)];
   self.streak4Name.text = @"Streak Name";
   self.streak4Name.adjustsFontSizeToFitWidth = YES;
   [self.streak4Name sizeThatFits:CGSizeMake(WIDTH/4, 30)];
   [self.scorestreakShell addSubview:self.streak4Name];
   
   self.streak4Image = [[UIImageView alloc] initWithFrame:CGRectMake(3 * WIDTH/4, self.scorestreakShell.frame.size.height - sideLength, sideLength, sideLength)];
   self.streak4Image.backgroundColor = [self randomColor];
   [self.scorestreakShell addSubview:self.streak4Image];
}
- (void)layoutPerks{
   //perk 1
   self.perk1Shell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH/3, PAGECONTROL_HEIGHT)];
   self.perk1Shell.backgroundColor = [self randomColor];
   [self addSubview:self.perk1Shell];
   
   UILabel *perk1Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.perk1Shell.frame.size.width, 30)];
   perk1Title.text = @"Perk 1";
   perk1Title.backgroundColor = [self randomColor];

   [self.perk1Shell addSubview:perk1Title];
   
   self.perk1Label = [[UILabel alloc] initWithFrame:CGRectMake(0, perk1Title.frame.origin.y + perk1Title.frame.size.height, self.perk1Shell.frame.size.width, 30)];
   self.perk1Label.text = @"A perk";
   self.perk1Label.backgroundColor = [self randomColor];
   self.perk1Label.adjustsFontSizeToFitWidth = YES;
   [self.perk1Label sizeThatFits:CGSizeMake(self.perk1Shell.frame.size.width, self.perk1Label.frame.size.height)];
   [self.perk1Shell addSubview:self.perk1Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk1Label.frame));

   self.perk1WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.perk1Label.frame.origin.y + self.perk1Label.frame.size.height, self.perk1Shell.frame.size.width, 30)];
   self.perk1WildcardLabel.text = @"Perk 1 Wild";
   self.perk1WildcardLabel.backgroundColor = [self randomColor];
   self.perk1WildcardLabel.adjustsFontSizeToFitWidth = YES;
   [self.perk1WildcardLabel sizeThatFits:CGSizeMake(self.perk1WildcardLabel.frame.size.width, self.perk1WildcardLabel.frame.size.height)];
   [self.perk1Shell addSubview:self.perk1WildcardLabel];
   
   NSInteger sideLength = (self.perk1Shell.frame.size.height - (self.perk1WildcardLabel.frame.origin.y + self.perk1WildcardLabel.frame.size.height))/2;

   self.perk1Image = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk1Shell.frame.size.width - sideLength)/2, self.perk1Shell.frame.size.height - sideLength, sideLength, sideLength)];
   self.perk1Image.backgroundColor = [self randomColor];
   [self.perk1Shell addSubview:self.perk1Image];
   
   self.perk1WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk1Shell.frame.size.width - sideLength)/2, self.perk1Image.frame.origin.y - sideLength, sideLength, sideLength)];
   self.perk1WildcardImage.backgroundColor = [self randomColor];
   [self.perk1Shell addSubview:self.perk1WildcardImage];
   
   
   self.perk2Shell = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/3, 0, WIDTH/3, PAGECONTROL_HEIGHT)];
   self.perk2Shell.backgroundColor = [self randomColor];
   [self addSubview:self.perk2Shell];
   
   UILabel *perk2Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.perk2Shell.frame.size.width, 30)];
   perk2Title.text = @"Perk 2";
   perk2Title.backgroundColor = [self randomColor];
   
   [self.perk2Shell addSubview:perk2Title];
   
   self.perk2Label = [[UILabel alloc] initWithFrame:CGRectMake(0, perk2Title.frame.origin.y + perk2Title.frame.size.height, self.perk2Shell.frame.size.width, 30)];
   self.perk2Label.text = @"A perk";
   self.perk2Label.backgroundColor = [self randomColor];
   self.perk2Label.adjustsFontSizeToFitWidth = YES;
   [self.perk2Label sizeThatFits:CGSizeMake(self.perk2Label.frame.size.width, self.perk1WildcardLabel.frame.size.height)];
   [self.perk2Shell addSubview:self.perk2Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk2Label.frame));
   
   self.perk2WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.perk2Label.frame.origin.y + self.perk2Label.frame.size.height, self.perk2Shell.frame.size.width, 30)];
   self.perk2WildcardLabel.text = @"Perk 2 Wild";
   self.perk2WildcardLabel.adjustsFontSizeToFitWidth = YES;
   self.perk2WildcardLabel.backgroundColor = [self randomColor];
   [self.perk2WildcardLabel sizeThatFits:CGSizeMake(self.perk2WildcardLabel.frame.size.width, self.perk2WildcardLabel.frame.size.height)];
   [self.perk2Shell addSubview:self.perk2WildcardLabel];
   
   
   self.perk2Image = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk2Shell.frame.size.width - sideLength)/2, self.perk2Shell.frame.size.height - sideLength, sideLength, sideLength)];
   self.perk2Image.backgroundColor = [self randomColor];
   [self.perk2Shell addSubview:self.perk2Image];
   
   self.perk2WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk2Shell.frame.size.width - sideLength)/2, self.perk2Image.frame.origin.y - sideLength, sideLength, sideLength)];
   self.perk2WildcardImage.backgroundColor = [self randomColor];
   [self.perk2Shell addSubview:self.perk2WildcardImage];
   
   self.perk3Shell = [[UIView alloc] initWithFrame:CGRectMake(2 * WIDTH/3, 0, WIDTH/3, PAGECONTROL_HEIGHT)];
   self.perk3Shell.backgroundColor = [self randomColor];
   [self addSubview:self.perk3Shell];
   
   UILabel *perk3Title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.perk3Shell.frame.size.width, 30)];
   perk3Title.text = @"Perk 3";
   perk3Title.backgroundColor = [self randomColor];
   
   [self.perk3Shell addSubview:perk3Title];
   
   self.perk3Label = [[UILabel alloc] initWithFrame:CGRectMake(0, perk3Title.frame.origin.y + perk3Title.frame.size.height, self.perk3Shell.frame.size.width, 30)];
   self.perk3Label.text = @"A perk";
   self.perk3Label.backgroundColor = [self randomColor];
   self.perk3Label.adjustsFontSizeToFitWidth = YES;
   [self.perk3Label sizeThatFits:CGSizeMake(self.perk3Label.frame.size.width, self.perk1WildcardLabel.frame.size.height)];
   [self.perk3Shell addSubview:self.perk3Label];
   NSLog(@"titanic: %@", NSStringFromCGRect(self.perk3Label.frame));
   
   self.perk3WildcardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.perk3Label.frame.origin.y + self.perk3Label.frame.size.height, self.perk3Shell.frame.size.width, 30)];
   self.perk3WildcardLabel.text = @"Perk 3 Wild";
   self.perk3WildcardLabel.backgroundColor = [self randomColor];
   self.perk3WildcardLabel.adjustsFontSizeToFitWidth = YES;
   [self.perk3WildcardLabel sizeThatFits:CGSizeMake(self.perk3WildcardLabel.frame.size.width, self.perk3WildcardLabel.frame.size.height)];
   [self.perk3Shell addSubview:self.perk3WildcardLabel];
   
   
   self.perk3Image = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk3Shell.frame.size.width - sideLength)/3, self.perk3Shell.frame.size.height - sideLength, sideLength, sideLength)];
   self.perk3Image.backgroundColor = [self randomColor];
   [self.perk3Shell addSubview:self.perk3Image];
   
   self.perk3WildcardImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.perk3Shell.frame.size.width - sideLength)/3, self.perk3Image.frame.origin.y - sideLength, sideLength, sideLength)];
   self.perk3WildcardImage.backgroundColor = [self randomColor];
   [self.perk3Shell addSubview:self.perk3WildcardImage];

}

- (void)layoutSecondary{
   self.secondaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryAttachmentShell.frame.origin.y + self.primaryAttachmentShell.frame.size.height + EDGE_OFFSET, WIDTH, 150)];
   self.secondaryImage.backgroundColor = [self randomColor];
   [self addSubview:self.secondaryImage];
   
   self.secondaryLabel = [[UILabel alloc] initWithFrame:self.secondaryImage.frame];
   self.secondaryLabel.text = @"Secondary Gun";
   [self addSubview:self.secondaryLabel];
   
   self.secondaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.secondaryImage.frame.origin.y + self.secondaryImage.frame.size.height, WIDTH, 80)];
   self.secondaryAttachmentShell.backgroundColor = [self randomColor];
   [self addSubview:self.secondaryAttachmentShell];
   
   self.secondaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel1.text = @"Attachment 1";
   self.secondaryAttachmentLabel1.adjustsFontSizeToFitWidth = YES;
   [self.secondaryAttachmentLabel1 sizeThatFits:CGSizeMake(self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel1];
   
   self.secondaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.secondaryAttachmentShell.frame.size.height/2, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel2.text = @"Attachment 2";
   self.secondaryAttachmentLabel2.adjustsFontSizeToFitWidth = YES;
   [self.secondaryAttachmentLabel2 sizeThatFits:CGSizeMake(self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel2];
   
   NSInteger attachWidth = self.secondaryAttachmentShell.frame.size.height;
   self.secondaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   self.secondaryAttachmentView1.backgroundColor = [self randomColor];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView1];
   
   self.secondaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   self.secondaryAttachmentView2.backgroundColor = [self randomColor];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView2];
   
   
}
- (void)layoutPrimary{
   //add image
   self.primaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, EDGE_OFFSET, WIDTH, 100)];
   self.primaryImage.backgroundColor = [self randomColor];
   [self addSubview:self.primaryImage];
   
   //add label
   self.primaryLabel = [[UILabel alloc] initWithFrame:self.primaryImage.frame];
   self.primaryLabel.text = @"Primary Gun";
   [self addSubview:self.primaryLabel];
   
   //add shell
   self.primaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryImage.frame.origin.y + self.primaryImage.frame.size.height, WIDTH, 60)];
   self.primaryAttachmentShell.backgroundColor = [self randomColor];
   [self addSubview:self.primaryAttachmentShell];
   
   self.primaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel1.text = @"Attachment 1";
   self.primaryAttachmentLabel1.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel1 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel1];
   
   self.primaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.primaryAttachmentShell.frame.size.height/3, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel2.text = @"Attachment 2";
   self.primaryAttachmentLabel2.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel2 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel2];
   
   self.primaryAttachmentLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.primaryAttachmentShell.frame.size.height/3 * 2, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel3.text = @"Attachment 3";
   self.primaryAttachmentLabel3.adjustsFontSizeToFitWidth = YES;
   [self.primaryAttachmentLabel3 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel3];
   
   NSInteger attachWidth = self.primaryAttachmentShell.frame.size.height;
   self.primaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView1.backgroundColor = [self randomColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView1];
   
   self.primaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView2.backgroundColor = [self randomColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView2];
   
   self.primaryAttachmentView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 3, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView3.backgroundColor = [self randomColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView3];
   
}

- (UIColor *)randomColor{
   CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
   CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
   CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
   UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
   return color;
}
@end
