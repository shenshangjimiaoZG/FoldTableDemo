
#import <UIKit/UIKit.h>
@class Song;

NS_ASSUME_NONNULL_BEGIN
static NSString *kSongHeaderView=@"SongHeaderView";

@interface SongHeaderView : UITableViewHeaderFooterView
@property(nonatomic,strong)Song *song;
@end

NS_ASSUME_NONNULL_END
