//
//  ContainCollectionViewCell.m
//  detail
//
//  Created by hejintao on 2017/6/12.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "ContainCollectionViewCell.h"
#import "Masonry.h"
#import "CategoriesCollecCell.h"
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
static NSString *collectionIdentifier = @"homecollectionIdentifier11111";
@interface ContainCollectionViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView *collection;

@end

@implementation ContainCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configUI];
    }
    return self;
}

-(void)configUI{
    [self.contentView addSubview:self.collection];
    [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(30);
    }];
}

-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
        layout.minimumInteritemSpacing = 10;
        CGFloat ww = IS_IPHONE ? (SCREEN_WIDTH - 40) / 3.2 : (SCREEN_WIDTH - 60) / 5;
        CGFloat h = ww + ww / 3 + 48; // 宽高 3:4
        layout.itemSize = CGSizeMake(ww, h);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collection = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor whiteColor];
        self.collection.showsHorizontalScrollIndicator = NO;
        [self.collection registerNib:[UINib nibWithNibName:@"CategoriesCollecCell" bundle:nil] forCellWithReuseIdentifier:collectionIdentifier];
        _collection.delegate = self;
        _collection.dataSource = self;
        
    }
    return _collection;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoriesCollecCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionIdentifier forIndexPath:indexPath];
    return cell;
}

@end
