//
//  PageViewController.h
//  AWRandom
//
//  Created by Kirby Gee on 11/26/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageViewController : UIViewController
@property (assign, nonatomic) NSInteger index;

- (instancetype)initWithIndex:(NSInteger)index;


@end
