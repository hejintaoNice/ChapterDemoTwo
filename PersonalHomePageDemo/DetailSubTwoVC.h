//
//  DetailSubTwoVC.h
//  DT
//
//  Created by hejintao on 2017/6/1.
//  Copyright © 2017年 hither. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailSubTwoVC : UIViewController
@property (assign, nonatomic) BOOL canScroll;
//判断手指是否离开
@property (nonatomic, assign) BOOL isTouch;
@property (nonatomic,strong) UICollectionView *collectionView;
@end
