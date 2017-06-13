//
//  LeftContentDescTableViewCell.h
//  PersonalHomePageDemo
//
//  Created by hejintao on 2017/6/12.
//  Copyright © 2017年 huangkejin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LeftContentDescTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLbl;

@property (nonatomic,strong) UILabel *desc;

-(void)config:(NSString*)str;

@end
