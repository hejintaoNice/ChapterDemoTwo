//
//  DetailSubTwoVC.m
//  DT
//
//  Created by hejintao on 2017/6/1.
//  Copyright © 2017年 hither. All rights reserved.
//

#import "DetailSubTwoVC.h"
#import "DetailCollectionViewCell.h"
#import "ContainCollectionViewCell.h"
#import "MoreButtonView.h"
#define CollectionViewNOXIBRegisterCell(collectionView, cellClass, cellID) [collectionView registerClass:[cellClass class] forCellWithReuseIdentifier:cellID];
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface DetailSubTwoVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (assign, nonatomic) BOOL isOpen;
@property (assign, nonatomic) NSInteger showButtonNumber;
@property (copy, nonatomic) NSMutableArray *titleArr;
@property (nonatomic,strong) MoreButtonView *footer;
@property (strong, nonatomic) UIButton *theButton;

@end

@implementation DetailSubTwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.collectionView];
    _showButtonNumber = 12;
    _titleArr  = [NSMutableArray array];
    //准备测试数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i = 0; i < 1000; i ++) {
            NSString *str = [NSString stringWithFormat:@"章节 %d",i];
            [_titleArr addObject:str];
        }
    });
    [self.collectionView reloadData];
}

- (void)handleAction:(UIButton *)sender{
    
    _isOpen = !_isOpen;
    _showButtonNumber = _isOpen ? _titleArr.count : 12;
    [sender setTitle: _isOpen ? @"收起" : @"查看更多" forState:UIControlStateNormal];
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        CollectionViewNOXIBRegisterCell(_collectionView, DetailCollectionViewCell, @"DetailCollectionViewCell_id")
        CollectionViewNOXIBRegisterCell(_collectionView, ContainCollectionViewCell, @"ContainCollectionViewCell_id")
        [self.collectionView registerClass:[MoreButtonView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView_id"];
        self.collectionView.alwaysBounceVertical = YES;
        self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    return _collectionView;
}



#pragma mark -- UICollectionViewDelegate && dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return section==0 ? _showButtonNumber : 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        DetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DetailCollectionViewCell_id" forIndexPath:indexPath];
        [cell configData:_titleArr[indexPath.row]];
        return cell;
    }else{
        ContainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContainCollectionViewCell_id" forIndexPath:indexPath];
        return cell;
    }
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake((SCREEN_WIDTH-60)/4, 29);
    }else{
        CGFloat w = (SCREEN_WIDTH - 40) / 3.2;
        CGFloat h = w + w / 3 + 48 + 54; // 图片宽高 3:4 加上名称和描述的高度 和 标题高度
        return CGSizeMake(SCREEN_WIDTH,h);
    }
}

- (UIButton *)theButton{
    
    if (!_theButton) {
        _theButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 5, SCREEN_WIDTH-30, 40)];
        [_theButton setTitle:@"查看更多" forState:UIControlStateNormal];
        [_theButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_theButton addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        [_theButton setBackgroundColor:[UIColor whiteColor]];
        _theButton.layer.cornerRadius = 15;
        _theButton.layer.masksToBounds = YES;
        _theButton.layer.borderWidth = 1;
        _theButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _theButton;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        MoreButtonView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView_id" forIndexPath:indexPath];
        [footer addSubview:self.theButton];
        return footer;
    }else{
        return nil;
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(SCREEN_WIDTH, 50);
    }else{
//        CGFloat w = (SCREEN_WIDTH - 40) / 3.2;
//        CGFloat h = w + w / 3 + 48 + 54; // 图片宽高 3:4 加上名称和描述的高度 和 标题高度
//        return CGSizeMake(w,h);
        return CGSizeZero;
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.isTouch = YES;
}

///用于判断手指是否离开了 要做到当用户手指离开了，tableview滑道顶部，也不显示出主控制器
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"手指离开了");
    self.isTouch = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.canScroll) {
        [scrollView setContentOffset:CGPointZero];
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY<0) {
        if (!self.isTouch) {//当手指离开了，也不允许显示主控制器，这里可以根据实际需求做处理
            return;
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kLeaveTopNtf" object:@1];
        self.canScroll = NO;
        scrollView.contentOffset = CGPointZero;
    }
}

@end
