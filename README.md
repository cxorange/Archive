# Archive
- (void)setClass:(const char *)className archiveWithCoder:(NSCoder *)aCoder;//归档
- (void)setClass:(const char *)className unArchiveWithCoder:(NSCoder *)aDecoder;//解档

className:const char 类型的字符
aCoder／aDecoder:NSCoder对象

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init]){
       [self setClass:"Person" unArchiverWithCoder:aDecoder];
    }
    return self;
}
- (void)encoderWithCoder:(NSCoder *)aCoder
{
    [self setClass:"Person" archiveWithCoder:aCoder];
}
