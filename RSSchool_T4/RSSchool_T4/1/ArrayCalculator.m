#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    // good luck
    // thanks :)
    
    NSMutableArray *tmpArr = [[NSMutableArray alloc] initWithArray:[array filteredArrayUsingPredicate:
                            [NSPredicate predicateWithFormat:@"self isKindOfClass: %@", NSNumber.class]]];
    
    [tmpArr sortUsingSelector:@selector(compare:)];
    
    if([tmpArr isEqual:@[]]) return 0;
    if(numberOfItems >= [tmpArr count]) return [self arrayProduct:tmpArr];
    
    // Arrays are sorted in the absolute descending order
    NSArray *positives = [[[tmpArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self > 0"]] reverseObjectEnumerator] allObjects];
    NSArray *negatives = [tmpArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self < 0"]];

    if([positives count] == 0 && numberOfItems % 2 == 0)
        return [self arrayProduct:[negatives subarrayWithRange:NSMakeRange(0, numberOfItems)]];

    NSMutableArray *maxSlice = [NSMutableArray new];
    
    if([negatives count] > 1) {
        // This part is the worst, i know
        NSUInteger border = [negatives count] % 2 == 0 ? [negatives count] : [negatives count] - 1;
        for(NSUInteger i = 0; i < border; i+=2)
            if([self productIn:negatives at:i at:i + 1] > [self productIn:positives at:i at:i + 1])
                [maxSlice addObjectsFromArray:[negatives subarrayWithRange:NSMakeRange(i, 2)]];
    }
    
    if([maxSlice count] < numberOfItems)
        [maxSlice addObjectsFromArray:[positives subarrayWithRange:NSMakeRange(0, numberOfItems - [maxSlice count])]];
    
    return [self arrayProduct:maxSlice];
}

+ (NSInteger)productIn:(NSArray *)array at:(NSUInteger)n1 at:(NSUInteger)n2 {
    return [[array objectAtIndex:n1] intValue] * [[array objectAtIndex:n2] intValue];
}

+ (NSInteger)arrayProduct:(NSArray *)array {
    NSInteger result = 1;
    for (NSNumber *i in array)
        result *= [i intValue];
    return result;
}
@end
