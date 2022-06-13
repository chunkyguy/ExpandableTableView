#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLIndexPath : NSObject <NSCopying>
+ (instancetype)indexPathForRow:(NSInteger)row
                      inSection:(NSInteger)section
                          level:(NSInteger)level;

@property (nonatomic, readonly) NSInteger row;
@property (nonatomic, readonly) NSInteger section;
@property (nonatomic, readonly) NSInteger level;
@property (nonatomic, readonly) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
