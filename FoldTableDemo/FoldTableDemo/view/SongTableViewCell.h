#import <UIKit/UIKit.h>

@class Song;

NS_ASSUME_NONNULL_BEGIN
static NSString *kSongTableViewCell=@"SongTableViewCell";

@interface SongTableViewCell : UITableViewCell
-(void)configCell:(Song*)info;
@end



NS_ASSUME_NONNULL_END
