//
//  DetailHeaderView.h
//  MKWeekly
//
//  Created by hejintao on 2016/12/19.
//  Copyright © 2016年 zymk. All rights reserved.
//

#import <UIKit/UIKit.h>



#define HeaderHeight 230.0
#define BlurHeight 180.0

@interface DetailHeaderView : UIView

@property (nonatomic,strong)UIButton *backBtn;

@property (nonatomic,strong)UIButton *downLoadBtn;

@property (nonatomic,strong)UIButton *readBtn;

@property (nonatomic,strong)UIButton *collectBtn;

@property (nonatomic,strong) UIButton *addToBookBtn;

@property (nonatomic,strong)UIButton *commentBtn;

@property (nonatomic,strong)UIImageView *comicHeadImg;


@end
