#import "FullBinaryTrees.h"

@interface Node : NSObject

@property (weak, nonatomic) Node *leftBranch;
@property (weak, nonatomic) Node *rightBranch;
@property (strong, nonatomic) NSString *value;

@end

@implementation Node

- (instancetype)initWithLeft:(Node *)l right:(Node *)r
{
    self = [super init];
    if (self) {
        _value = @"0";
        _leftBranch = l;
        _rightBranch = r;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = @"0";
        _leftBranch = [[Node alloc] initAsNull];
        _rightBranch = [[Node alloc] initAsNull];
    }
    return self;
}

- (instancetype)initAsNull
{
    self = [super init];
    if (self) {
        _value = @"null";
    }
    return self;
}

@end



@interface FullBinaryTrees ()

@property (strong, nonatomic) NSMutableString *result;
@property (strong, nonatomic) NSMutableArray *storage;
@property (strong, nonatomic) NSMutableString *stringResult;

@end

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    // good luck
    // i like this imaginary conversation
    
    if(count == 1) return @"[[0]]";
    if(count % 2 == 0) return [NSString stringWithFormat:@"[]"];

    NSMutableArray *tmp = [FullBinaryTrees combinations:count];

    self.result = [NSMutableString new];
    
    for (Node *node in tmp) {
        self.storage = [NSMutableArray new];
        [self levelOrderTraversal:node];
        while([[self.storage lastObject] isEqual:@"null"]) [self.storage removeLastObject];
     
        self.stringResult = [NSMutableString stringWithString:@"["];
        [self.storage enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self.stringResult appendString:[NSString stringWithFormat:@"%@,", obj]];
        }];
        [self.stringResult replaceCharactersInRange:NSMakeRange(self.stringResult.length - 1, 1) withString:@"]"];
        
        [self.result appendString:self.stringResult];
    }
    
    return self.result;
    
}

+ (NSMutableArray<Node*> *)combinations:(NSInteger)remainCount {
    NSMutableArray *result = [NSMutableArray new];
    if(remainCount == 1) {
        [result addObject:[Node new]];
        return result;
    }
    
    for(NSUInteger i = 1; i < remainCount - 1; i++) {
        if(i == 2 || remainCount - i - 1 == 2) continue;
        NSMutableArray *leftBranch = [NSMutableArray arrayWithArray:[self combinations:i]];
        NSMutableArray *rightBranch = [NSMutableArray arrayWithArray:[self combinations:remainCount - i - 1]];
        for(Node *lefty in leftBranch)
            for(Node *righty in rightBranch)
                [result addObject:[[Node alloc] initWithLeft:lefty right:righty]];
    }
    
    return [result mutableCopy];
}

- (BOOL)getLevel:(Node *)root and:(NSUInteger)level {
    if(root == nil)
        return false;

    if(level == 1) {
        [self.storage addObject:root.value];
        return true;
    }
    
    bool left = [self getLevel:root.leftBranch and:level - 1];
    bool right = [self getLevel:root.rightBranch and:level - 1];
    
    return left || right;
}

- (void)levelOrderTraversal:(Node *)root {
    NSUInteger level = 1;
    while([self getLevel:root and:level++]);
}

@end
