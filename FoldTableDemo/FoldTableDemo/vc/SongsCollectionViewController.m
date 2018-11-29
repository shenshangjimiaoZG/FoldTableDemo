#import "SongsCollectionViewController.h"
#import "YUFoldingTableView.h"
#import "SongTableViewCell.h"
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <HJNetwork/HJNetwork.h>
#import "SongViewModel.h"
#import "UITableViewCell+HYBMasonryAutoCellHeight.h"
#import "SongHeaderView.h"
#import <MJRefresh/MJRefresh.h>


@interface SongsCollectionViewController ()<YUFoldingTableViewDelegate>
@property(nonatomic,strong)YUFoldingTableView *table;
@property (nonatomic, assign) YUFoldingSectionHeaderArrowPosition arrowPosition;
@property(nonatomic,strong)NSMutableArray *list;
@end

@implementation SongsCollectionViewController

#pragma mark 加载数据
-(void)getSongs
{
   
    __weak typeof(self)weakSelf=self;
    
   
        
    [[SongViewModel getSongs]subscribeNext:^(NSArray   * _Nullable item) {
            
             weakSelf.list=[NSMutableArray arrayWithArray:item];
        }];
        
        [[SongViewModel getSongs]subscribeCompleted:^{
           
            [weakSelf.table reloadData];
            [weakSelf.table.mj_header endRefreshing];
            [SVProgressHUD dismiss];
        }];
   
    
    
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.table=[[YUFoldingTableView alloc]initWithFrame:CGRectZero];
    self.table.foldingDelegate=self;
    self.table.foldingState = YUFoldingSectionStateFlod;
    [self.view addSubview:self.table];
    
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
    }];
    
    [SVProgressHUD showWithStatus:@"加载中..."];
    
    self.table.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self performSelector:@selector(getSongs) withObject:nil afterDelay:3];
    }];
    [self.table.mj_header beginRefreshing];
}
#pragma mark table delegate
/**
 *  返回section的个数
 */
- (NSInteger )numberOfSectionForYUFoldingTableView:(YUFoldingTableView *)yuTableView
{
    return self.list.count;
}
/**
 *  cell的个数
 */
- (NSInteger )yuFoldingTableView:(YUFoldingTableView *)yuTableView numberOfRowsInSection:(NSInteger )section
{
    return 1;
}
/**
 *  header的高度
 */
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForHeaderInSection:(NSInteger )section
{
    return 80;
}
/**
 *  cell的高度
 */
- (CGFloat )yuFoldingTableView:(YUFoldingTableView *)yuTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        Song *song=self.list.firstObject;
        
        return [SongTableViewCell hyb_heightForTableView:yuTableView config:^(UITableViewCell *sourceCell) {
            
            SongTableViewCell *cell=(SongTableViewCell*)sourceCell;
            [cell configCell:song];
            
        } cache:^NSDictionary *{
            
          
            return @{kHYBCacheUniqueKey:song.lyric==nil?@"sugar":song.lyric,kHYBCacheStateKey:song.lyric==nil?@"sugar":song.lyric,kHYBRecalculateForStateKey:@(YES)};
        }];
    }
    else
    {
        
            Song *song=self.list.lastObject;
            
            return [SongTableViewCell hyb_heightForTableView:yuTableView config:^(UITableViewCell *sourceCell) {
                
                SongTableViewCell *cell=(SongTableViewCell*)sourceCell;
                [cell configCell:song];
                
            } cache:^NSDictionary *{
                
                
                return @{kHYBCacheUniqueKey:song.lyric==nil?@"see you again":song.lyric,kHYBCacheStateKey:song.lyric==nil?@"see you again":song.lyric,kHYBRecalculateForStateKey:@(YES)};
            }];
        
    }
}
/**
 *  返回cell
 */
- (UITableViewCell *)yuFoldingTableView:(YUFoldingTableView *)yuTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SongTableViewCell *cell=[yuTableView dequeueReusableCellWithIdentifier:kSongTableViewCell];
    if(cell==nil)
    {
        cell=[[SongTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSongTableViewCell];
    }
    [cell configCell:self.list[indexPath.section]];
    return cell;
}



/**
 *  返回HeaderView
 */
- (UIView *)yuFoldingTableView:(UITableView *)yuTableView viewForHeaderInSection:(NSInteger)section
{
    SongHeaderView *view=[yuTableView dequeueReusableHeaderFooterViewWithIdentifier:kSongHeaderView];
    if(view==nil)
    {
        view=[[SongHeaderView alloc]initWithReuseIdentifier:kSongHeaderView];
    }
    
    view.song=self.list[section];
    
    return view;
}

@end
