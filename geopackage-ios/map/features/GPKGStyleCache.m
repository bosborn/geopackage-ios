//
//  GPKGStyleCache.m
//  geopackage-ios
//
//  Created by Brian Osborn on 2/18/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "GPKGStyleCache.h"
#import "GPKGStyleUtils.h"

@interface GPKGStyleCache ()

/**
 * Feature style extension
 */
@property (nonatomic, strong) GPKGFeatureStyleExtension *featureStyleExtension;

/**
 * Icon image cache
 */
@property (nonatomic, strong) GPKGIconCache *iconCache;

@end

@implementation GPKGStyleCache

-(instancetype) initWithGeoPackage: (GPKGGeoPackage *) geoPackage{
    self = [self initWithGeoPackage:geoPackage andScale:[UIScreen mainScreen].scale];
    return self;
}

-(instancetype) initWithGeoPackage: (GPKGGeoPackage *) geoPackage andScale: (float) scale{
    self = [self initWithGeoPackage:geoPackage andScale:scale andIconCacheSize:DEFAULT_ICON_CACHE_SIZE];
    return self;
}

-(instancetype) initWithGeoPackage: (GPKGGeoPackage *) geoPackage andIconCacheSize: (int) iconCacheSize{
    self = [self initWithGeoPackage:geoPackage andScale:[UIScreen mainScreen].scale andIconCacheSize:iconCacheSize];
    return self;
}

-(instancetype) initWithGeoPackage: (GPKGGeoPackage *) geoPackage andScale: (float) scale andIconCacheSize: (int) iconCacheSize{
    self = [self initWithExtension:[[GPKGFeatureStyleExtension alloc] initWithGeoPackage:geoPackage] andScale:scale andIconCacheSize:iconCacheSize];
    return self;
}

-(instancetype) initWithExtension: (GPKGFeatureStyleExtension *) featureStyleExtension{
    self = [self initWithExtension:featureStyleExtension andScale:[UIScreen mainScreen].scale];
    return self;
}

-(instancetype) initWithExtension: (GPKGFeatureStyleExtension *) featureStyleExtension andScale: (float) scale{
    self = [self initWithExtension:featureStyleExtension andScale:scale andIconCacheSize:DEFAULT_ICON_CACHE_SIZE];
    return self;
}

-(instancetype) initWithExtension: (GPKGFeatureStyleExtension *) featureStyleExtension andIconCacheSize: (int) iconCacheSize{
    self = [self initWithExtension:featureStyleExtension andScale:[UIScreen mainScreen].scale andIconCacheSize:iconCacheSize];
    return self;
}

-(instancetype) initWithExtension: (GPKGFeatureStyleExtension *) featureStyleExtension andScale: (float) scale andIconCacheSize: (int) iconCacheSize{
    self = [super init];
    if(self != nil){
        self.featureStyleExtension = featureStyleExtension;
        self.iconCache = [[GPKGIconCache alloc] initWithSize:iconCacheSize];
        self.scale = scale;
    }
    return self;
}

-(void) clear{
    [self.iconCache clear];
}

-(GPKGFeatureStyleExtension *) featureStyleExtension{
    return _featureStyleExtension;
}

-(BOOL) setFeatureStyleWithMapPoint: (GPKGMapPoint *) mapPoint andFeature: (GPKGFeatureRow *) featureRow{
    return [GPKGStyleUtils setFeatureStyleWithMapPoint:mapPoint andExtension:self.featureStyleExtension andFeature:featureRow andScale:self.scale andIconCache:self.iconCache];
}

-(BOOL) setFeatureStyleWithMapPoint: (GPKGMapPoint *) mapPoint andFeatureStyle: (GPKGFeatureStyle *) featureStyle{
    return [GPKGStyleUtils setFeatureStyleWithMapPoint:mapPoint andFeatureStyle:featureStyle andScale:self.scale andIconCache:self.iconCache];
}

-(BOOL) setIconWithMapPoint: (GPKGMapPoint *) mapPoint andIcon: (GPKGIconRow *) icon{
    return [GPKGStyleUtils setIconWithMapPoint:mapPoint andIcon:icon andScale:self.scale andIconCache:self.iconCache];
}

-(UIImage *) createIconImageWithIcon: (GPKGIconRow *) icon{
    return [GPKGStyleUtils createIconImageWithIcon:icon andScale:self.scale andIconCache:self.iconCache];
}

-(BOOL) setStyleWithMapPoint: (GPKGMapPoint *) mapPoint andStyle: (GPKGStyleRow *) style{
    return [GPKGStyleUtils setStyleWithMapPoint:mapPoint andStyle:style];
}

@end
