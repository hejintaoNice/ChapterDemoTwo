//
//  CategoriesCollecCell.h
//  ManHua
//
//  Created by YinDongbing on 2017/1/5.
//  Copyright © 2017年 Yoon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesCollecCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *scorebtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgview;
@property (weak, nonatomic) IBOutlet UILabel *chapterlbl;
@property (weak, nonatomic) IBOutlet UILabel *namelbl;
@property (weak, nonatomic) IBOutlet UILabel *desclbl;
@property (weak, nonatomic) IBOutlet UIView *imgWaper;

@end
