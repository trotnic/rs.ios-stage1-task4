#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    // good luck
    //
    
    if([number intValue] < 0) return nil;
    
    NSMutableString *mCopy = [[NSMutableString alloc] initWithString:number];
    NSMutableArray *result = [NSMutableArray new];
    
    for(NSUInteger i = 0; i < [number length]; i++) {
        NSRange position = NSMakeRange(i, 1);
        switch ([[number substringWithRange:position] intValue]) {
            case 0:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"8"]];
                break;
            case 1:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"4"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"2"]];
                break;
            case 2:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"1"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"5"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"3"]];
                break;
            case 3:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"2"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"6"]];
                break;
            case 4:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"1"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"5"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"7"]];
                break;
            case 5:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"2"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"4"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"6"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"8"]];
                break;
            case 6:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"3"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"5"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"9"]];
                break;
            case 7:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"4"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"8"]];
                break;
            case 8:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"5"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"7"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"9"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"0"]];
                break;
            case 9:
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"6"]];
                [result addObject:[mCopy stringByReplacingCharactersInRange:position withString:@"8"]];
                break;
            
            default:
                break;
        }
    }
    
    return [NSArray arrayWithArray:result];
}
@end
