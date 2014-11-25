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
@end

@implementation DisplayCase

- (instancetype)initWithFrame:(CGRect)frame{
   self = [super initWithFrame:frame];
   if (self) {
      [self layoutPrimary];
      [self layoutSecondary];
   }
   
   return self;
}

- (void)layoutSecondary{
   self.secondaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryAttachmentShell.frame.origin.y + self.primaryAttachmentShell.frame.size.height + EDGE_OFFSET, WIDTH, 150)];
   self.secondaryImage.backgroundColor = [UIColor greenColor];
   [self addSubview:self.secondaryImage];
   
   self.secondaryLabel = [[UILabel alloc] initWithFrame:self.secondaryImage.frame];
   self.secondaryLabel.text = @"Secondary Gun";
   [self addSubview:self.secondaryLabel];
   
   self.secondaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.secondaryImage.frame.origin.y + self.secondaryImage.frame.size.height, WIDTH, 80)];
   self.secondaryAttachmentShell.backgroundColor = [UIColor grayColor];
   [self addSubview:self.secondaryAttachmentShell];
   
   self.secondaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel1.text = @"Attachment 1";
   [self.secondaryAttachmentLabel1 sizeThatFits:CGSizeMake(self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel1];
   
   self.secondaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.secondaryAttachmentShell.frame.size.height/2, self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   self.secondaryAttachmentLabel2.text = @"Attachment 2";
   [self.secondaryAttachmentLabel2 sizeThatFits:CGSizeMake(self.secondaryAttachmentShell.frame.size.width, self.secondaryAttachmentShell.frame.size.height/2)];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentLabel2];
   
   NSInteger attachWidth = self.secondaryAttachmentShell.frame.size.height;
   self.secondaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   self.secondaryAttachmentView1.backgroundColor = [UIColor redColor];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView1];
   
   self.secondaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.secondaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   self.secondaryAttachmentView2.backgroundColor = [UIColor blueColor];
   [self.secondaryAttachmentShell addSubview:self.secondaryAttachmentView2];
   
   
}
- (void)layoutPrimary{
   //add image
   self.primaryImage = [[UIImageView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, EDGE_OFFSET, WIDTH, 100)];
   self.primaryImage.backgroundColor = [UIColor purpleColor];
   [self addSubview:self.primaryImage];
   
   //add label
   self.primaryLabel = [[UILabel alloc] initWithFrame:self.primaryImage.frame];
   self.primaryLabel.text = @"Primary Gun";
   [self addSubview:self.primaryLabel];
   
   //add shell
   self.primaryAttachmentShell = [[UIView alloc] initWithFrame:CGRectMake(EDGE_OFFSET, self.primaryImage.frame.origin.y + self.primaryImage.frame.size.height, WIDTH, 60)];
   self.primaryAttachmentShell.backgroundColor = [UIColor redColor];
   [self addSubview:self.primaryAttachmentShell];
   
   self.primaryAttachmentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel1.text = @"Attachment 1";
   [self.primaryAttachmentLabel1 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel1];
   
   self.primaryAttachmentLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.primaryAttachmentShell.frame.size.height/3, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel2.text = @"Attachment 2";
   [self.primaryAttachmentLabel2 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel2];
   
   self.primaryAttachmentLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.primaryAttachmentShell.frame.size.height/3 * 2, self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   self.primaryAttachmentLabel3.text = @"Attachment 3";
   [self.primaryAttachmentLabel3 sizeThatFits:CGSizeMake(self.primaryAttachmentShell.frame.size.width, self.primaryAttachmentShell.frame.size.height/3)];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentLabel3];
   
   NSInteger attachWidth = self.primaryAttachmentShell.frame.size.height;
   self.primaryAttachmentView1 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView1.backgroundColor = [UIColor greenColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView1];
   
   self.primaryAttachmentView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 2, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView2.backgroundColor = [UIColor blueColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView2];
   
   self.primaryAttachmentView3 = [[UIImageView alloc] initWithFrame:CGRectMake(self.primaryAttachmentShell.frame.size.width - attachWidth * 3, 0, attachWidth, attachWidth)];
   self.primaryAttachmentView3.backgroundColor = [UIColor orangeColor];
   [self.primaryAttachmentShell addSubview:self.primaryAttachmentView3];
   
}
@end
