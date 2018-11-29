#import <Foundation/Foundation.h>
#import "Song.h"
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface SongViewModel : NSObject
+(RACSignal*)getSongs;
@end



NS_ASSUME_NONNULL_END
