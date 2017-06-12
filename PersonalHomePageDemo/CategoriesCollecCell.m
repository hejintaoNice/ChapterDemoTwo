//
//  CategoriesCollecCell.m
//  ManHua
//
//  Created by YinDongbing on 2017/1/5.
//  Copyright © 2017年 Yoon. All rights reserved.
//

#import "CategoriesCollecCell.h"
@implementation CategoriesCollecCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgWaper.layer.cornerRadius = 3.0;
    self.imgWaper.clipsToBounds = YES;
    self.scorebtn.layer.cornerRadius = 10;
}

@end
