#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    // good luck
    // i appreciate this :)
    
    if([number intValue] < 5) return nil;
    NSMutableArray *result = [SquareDecomposer decomposerWithCount:[number intValue] andRemainder:pow([number intValue], 2)];
    [result removeLastObject];
    return result;
}

+ (NSMutableArray *)decomposerWithCount:(NSInteger)n andRemainder:(NSInteger)r {
    if(r == 0)
        return [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithLong:n], nil];
    
    for(NSUInteger i = n - 1; i > 0; i--)
        if((r - pow(i,2)) >= 0) {
            NSMutableArray *result = [[NSMutableArray alloc] initWithArray:[self decomposerWithCount:i andRemainder:(r - pow(i,2))]];
            if([result count] != 0) {
                [result addObject:[NSNumber numberWithLong:n]];
                return result;
            }
        }
    
    return [[NSMutableArray alloc] initWithArray:@[]];
}
@end
