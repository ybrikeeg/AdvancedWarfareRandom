//
//  PageViewController.m
//  AWRandom
//
//  Created by Kirby Gee on 11/26/14.
//  Copyright (c) 2014 Kirby Gee - Stanford Univeristy. All rights reserved.
//

#import "PageViewController.h"

@implementation PageViewController

- (instancetype)initWithIndex:(NSInteger)index{
   self = [super init];
   if (self) {
      self.index = index;
      NSLog(@"created: %ld", (long)self.index);
   }
   
   return self;
}
@end
