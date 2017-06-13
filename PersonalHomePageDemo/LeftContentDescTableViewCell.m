//
//  LeftContentDescTableViewCell.m
//  PersonalHomePageDemo
//
//  Created by hejintao on 2017/6/12.
//  Copyright © 2017年 huangkejin. All rights reserved.
//

#import "LeftContentDescTableViewCell.h"


@implementation LeftContentDescTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.nameLbl];
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
    }];
    
    [self.contentView addSubview:self.desc];
    [self.desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLbl.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.top.equalTo(self.nameLbl.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

-(UILabel *)nameLbl{
    if (!_nameLbl) {
        _nameLbl = [[UILabel alloc]init];
        _nameLbl.textColor = RGBCOLOR(188, 188, 188);
        _nameLbl.font = HJTFont(13)
    }
    return _nameLbl;
}

-(UILabel *)desc{
    if (!_desc) {
        _desc = [[UILabel alloc]init];
        _desc.textColor = RGBCOLOR(102, 102, 102);
        _desc.font = HJTFont(13)
        _desc.numberOfLines = 0;
    }
    return _desc;
}

-(void)config:(NSString *)str{
    self.desc.text = str;
}

@end
