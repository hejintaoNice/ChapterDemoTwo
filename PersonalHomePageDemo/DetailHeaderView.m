//
//  DetailHeaderView.m
//  MKWeekly
//
//  Created by hejintao on 2016/12/19.
//  Copyright © 2016年 zymk. All rights reserved.
//

#import "DetailHeaderView.h"

@interface DetailHeaderView()

@property (nonatomic,strong)UIView *tableHeaderView;

@property (nonatomic,strong)UIImageView *blurHeadImg;

@property (nonatomic,strong)UILabel *comicName;

@property (nonatomic,strong)UILabel *authorName;

@property (nonatomic,strong) UIView *tagView;

@property (nonatomic,strong)UIImageView *fireImg;
@property (nonatomic,strong)UILabel *hotLabel;

@property (nonatomic,strong)NSMutableArray *comicTagNames;

@property (nonatomic,strong)UIImageView *markView;
@property (nonatomic,strong)UIImageView *starView;

@property (nonatomic,strong)UILabel *markLabel;

@property (nonatomic,strong)UIView *comicBgView;
@property (nonatomic,strong)UILabel *commentLabel;

@end

@implementation DetailHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}


-(UIView *)tableHeaderView{
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HeaderHeight)];
    }
    return _tableHeaderView;
}

-(UIImageView *)blurHeadImg{
    if (!_blurHeadImg) {
        _blurHeadImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, BlurHeight)];
        _blurHeadImg.image = [UIImage imageNamed:@"temporarybg"];
        _blurHeadImg.contentMode = UIViewContentModeScaleAspectFill;
        _blurHeadImg.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _blurHeadImg.clipsToBounds = YES;
    }
    return _blurHeadImg;
}

-(UIView *)comicBgView{
    if (!_comicBgView) {
        self.comicBgView = [[UIView alloc]init];
        self.comicBgView.backgroundColor = [UIColor whiteColor];
        self.comicBgView.clipsToBounds = YES;
        self.comicBgView.layer.shadowColor = RGBCOLOR(130, 130, 130).CGColor;
        self.comicBgView.layer.shadowOffset = CGSizeMake(0, 0.5);
        self.comicBgView.layer.shadowOpacity = 0.8;
        self.comicBgView.clipsToBounds = NO;
    }
    return _comicBgView;
}

-(UIImageView *)comicHeadImg{
    if (!_comicHeadImg) {
        _comicHeadImg = [[UIImageView alloc]init];
        _comicHeadImg.backgroundColor = RGBCOLOR(213, 213, 213);
        _comicHeadImg.contentMode = UIViewContentModeScaleAspectFill;
        _comicHeadImg.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _comicHeadImg.clipsToBounds = YES;
        _comicHeadImg.image = [UIImage imageNamed:@"pic_loadimg"];
    }
    return _comicHeadImg;
}

-(UIImageView *)markView{
    if (!_markView) {
        _markView = [[UIImageView alloc]init];
        _markView.image = [UIImage imageNamed:@"bg_starbg"];
    }
    return _markView;
}

-(UIImageView *)starView{
    if (!_starView) {
        _starView = [[UIImageView alloc]init];
        _starView.image = [UIImage imageNamed:@"ic_list_star"];
    }
    return _starView;
}

-(UILabel *)markLabel{
    if (!_markLabel) {
        _markLabel = [[UILabel alloc]init];
        _markLabel.font = HJTFont(10);
        _markLabel.textAlignment = NSTextAlignmentCenter;
        _markLabel.textColor = [UIColor whiteColor];
    }
    return _markLabel;
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        [_backBtn setImage:[UIImage imageNamed:@"white_nav_back"] forState:UIControlStateNormal];
        _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _backBtn;
}

-(UIButton *)commentBtn{
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc]init];
        [_commentBtn setImage:[UIImage imageNamed:@"white_comment_img"] forState:UIControlStateNormal];
    }
    return _commentBtn;
}

-(UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc]init];
        _commentLabel.textAlignment = NSTextAlignmentCenter;
        _commentLabel.layer.cornerRadius = 5.f;
        _commentLabel.layer.masksToBounds = YES;
        _commentLabel.backgroundColor = RGBCOLOR(254, 100, 85);
        _commentLabel.textColor = [UIColor whiteColor];
        _commentLabel.font = HJTFont(9);
        _commentLabel.hidden = YES;
    }
    return _commentLabel;
}

-(UILabel *)comicName{
    if (!_comicName) {
        _comicName = [[UILabel alloc]init];
        _comicName.font = HJTFont(18);
        _comicName.textColor = [UIColor whiteColor];
    }
    return _comicName;
}

-(UIButton *)collectBtn{
    if (!_collectBtn) {
        _collectBtn = [[UIButton alloc]init];
        [_collectBtn setImage:[UIImage imageNamed:@"white_collect_img"] forState:UIControlStateNormal];
    }
    return _collectBtn;
}

- (UIButton *)addToBookBtn{
    if (!_addToBookBtn) {
        _addToBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addToBookBtn setImage:[UIImage imageNamed:@"漫画详情页书单图标add"] forState:UIControlStateNormal];
    }
    return _addToBookBtn;
}

-(UILabel *)authorName{
    if (!_authorName) {
        _authorName = [[UILabel alloc]init];
        _authorName.font = HJTFont(11);
        _authorName.textColor = [UIColor whiteColor];
    }
    return _authorName;
}

-(UIView *)tagView{
    if (!_tagView) {
        _tagView = [[UIView alloc]init];
    }
    return _tagView;
}

-(UIImageView *)fireImg{
    if (!_fireImg) {
        _fireImg = [[UIImageView alloc]init];
        _fireImg.image = [UIImage imageNamed:@"ic_firelist_fire"];
        _fireImg.hidden = YES;
    }
    return _fireImg;
}

-(UILabel *)hotLabel{
    if (!_hotLabel) {
        _hotLabel = [[UILabel alloc]init];
        _hotLabel.textColor = [UIColor whiteColor];
        _hotLabel.font = HJTFont(12);
        _hotLabel.hidden = YES;
    }
    return _hotLabel;
}

-(UIButton *)downLoadBtn{
    if (!_downLoadBtn) {
        _downLoadBtn = [[UIButton alloc]init];
        _downLoadBtn.titleLabel.font  = HJTFont(14);
        _downLoadBtn.layer.cornerRadius = 15.f;
        _downLoadBtn.layer.masksToBounds = YES;
        _downLoadBtn.layer.borderWidth = 1;
        _downLoadBtn.layer.borderColor = RGBCOLOR(255, 148, 98).CGColor;
        [_downLoadBtn setTitle:@"离线缓存" forState:UIControlStateNormal];
        [_downLoadBtn setTitleColor:RGBCOLOR(255, 148, 98) forState:UIControlStateNormal];
    }
    return _downLoadBtn;
}

-(UIButton *)readBtn{
    if (!_readBtn) {
        _readBtn = [[UIButton alloc]init];
        _readBtn.layer.cornerRadius = 15.f;
        _readBtn.titleLabel.font  = HJTFont(14);
        _readBtn.layer.masksToBounds = YES;
        [_readBtn setTitle:@"开始阅读" forState:UIControlStateNormal];
        [_readBtn setBackgroundColor:RGBCOLOR(252, 84, 100)];
        [_readBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _readBtn;
}

-(void)configView{
    
    [self addSubview:self.tableHeaderView];
    [self.tableHeaderView addSubview:self.blurHeadImg];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectViuew = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    effectViuew.alpha = 1;
    [self.blurHeadImg addSubview:effectViuew];
    [effectViuew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.blurHeadImg);
    }];
    [self.tableHeaderView addSubview:self.comicBgView];
    
    [self.comicBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableHeaderView.mas_left).offset(12.0);
        make.bottom.equalTo(self.blurHeadImg.mas_bottom).offset(38.0);
        make.width.equalTo(@(108.0)); // 设计图尺寸
        make.height.equalTo(@(146.0));
    }];
    
    [self.comicBgView addSubview:self.comicHeadImg];
    [self.comicHeadImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.comicBgView.mas_top).offset(2);
        make.bottom.equalTo(self.comicBgView.mas_bottom).offset(-2);
        make.left.equalTo(self.comicBgView.mas_left).offset(2);
        make.right.equalTo(self.comicBgView.mas_right).offset(-2);
    }];
    
    [self.comicHeadImg addSubview:self.markView];
    [self.markView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.comicHeadImg);
        make.width.equalTo(@40);
        make.height.equalTo(@18);
    }];
    
    [self.markView addSubview:self.starView];
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.markView.mas_centerY);
        make.left.equalTo(self.markView.mas_left).offset(6);
        make.width.height.equalTo(@6.5);
    }];
    
    [self.markView addSubview:self.markLabel];
    [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starView.mas_right).offset(3);
        make.centerY.equalTo(self.markView);
        make.right.equalTo(self.markView.mas_right).offset(-5);
    }];
    
    [self.tableHeaderView addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableHeaderView.mas_left).offset(12.5);
        make.top.equalTo(@20.0);
        make.width.equalTo(@50.0);
        make.height.equalTo(@40.0);
    }];
    
    [self.tableHeaderView addSubview:self.commentBtn];
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.tableHeaderView.mas_right);
        make.centerY.equalTo(self.backBtn);
        make.height.equalTo(@40.0);
        make.width.equalTo(@50);
    }];

    [self.commentBtn addSubview:self.commentLabel];
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_commentBtn.mas_right).offset(-5);
        make.top.equalTo(_commentBtn.mas_top).offset(5);
        make.width.equalTo(@20);
        make.height.equalTo(@10);
    }];
    
    [self.tableHeaderView addSubview:self.collectBtn];
    [self.collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.commentBtn.mas_left);
        make.centerY.equalTo(self.backBtn);
        make.width.equalTo(@50.0);
        make.height.equalTo(@40.0);
    }];
    
    [self.tableHeaderView addSubview:self.addToBookBtn];
    [self.addToBookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.collectBtn.mas_left);
        make.centerY.equalTo(self.backBtn);
        make.width.height.equalTo(self.collectBtn);
    }];
    
    [self.tableHeaderView addSubview:self.comicName];
    [self.comicName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.comicBgView.mas_top).offset(5);
        make.left.equalTo(self.comicBgView.mas_right).offset(14);
        make.right.equalTo(self.tableHeaderView.mas_right).offset(-12.5);
        make.height.equalTo(@23.0);
    }];

    [self.tableHeaderView addSubview:self.authorName];
    [self.authorName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.comicName.mas_bottom);
        make.left.equalTo(self.comicName.mas_left);
        make.width.equalTo(self.comicName);
        make.height.equalTo(@16.0);
    }];

    [self.tableHeaderView addSubview:self.tagView];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorName.mas_bottom).offset(5);
        make.left.equalTo(self.comicName.mas_left);
        make.width.equalTo(self.comicName);
        make.height.equalTo(@28.0);
    }];

    [self.tableHeaderView addSubview:self.fireImg];
    [self.fireImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(6.0);
        make.left.equalTo(self.comicName.mas_left);
        make.width.equalTo(@10);
        make.height.equalTo(@12);
    }];
    
    [self.tableHeaderView addSubview:self.hotLabel];
    [self.hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.fireImg);
        make.left.equalTo(self.fireImg.mas_right).offset(5);
    }];

    [self.tableHeaderView addSubview:self.downLoadBtn];
    [self.tableHeaderView addSubview:self.readBtn];
    
    [self.downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.comicName.mas_left);
        make.right.equalTo(self.readBtn.mas_left).offset(-14.0);
        make.bottom.equalTo(self.comicBgView.mas_bottom).offset(-2.0);
        make.height.equalTo(@30.0);
        make.width.equalTo(self.readBtn.mas_width);
    }];
    [self.readBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.downLoadBtn);
        make.width.height.equalTo(self.downLoadBtn);
        make.right.equalTo(self.tableHeaderView.mas_right).offset(-12.0);
    }];
    
    _comicTagNames = [NSMutableArray array];
}

@end
