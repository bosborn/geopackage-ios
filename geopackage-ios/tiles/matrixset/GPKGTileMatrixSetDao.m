//
//  GPKGTileMatrixSetDao.m
//  geopackage-ios
//
//  Created by Brian Osborn on 5/18/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import "GPKGTileMatrixSetDao.h"
#import "GPKGContentsDao.h"
#import "GPKGSpatialReferenceSystemDao.h"
#import "GPKGUtils.h"

@implementation GPKGTileMatrixSetDao

-(instancetype) initWithDatabase: (GPKGConnection *) database{
    self = [super initWithDatabase:database];
    if(self != nil){
        self.tableName = GPKG_TMS_TABLE_NAME;
        self.idColumns = @[GPKG_TMS_COLUMN_PK];
        self.columns = @[GPKG_TMS_COLUMN_TABLE_NAME, GPKG_TMS_COLUMN_SRS_ID, GPKG_TMS_COLUMN_MIN_X, GPKG_TMS_COLUMN_MIN_Y, GPKG_TMS_COLUMN_MAX_X, GPKG_TMS_COLUMN_MAX_Y];
        [self initializeColumnIndex];
    }
    return self;
}

-(NSObject *) createObject{
    return [[GPKGTileMatrixSet alloc] init];
}

-(void) setValueInObject: (NSObject*) object withColumnIndex: (int) columnIndex withValue: (NSObject *) value{
    
    GPKGTileMatrixSet *setObject = (GPKGTileMatrixSet*) object;
    
    switch(columnIndex){
        case 0:
            setObject.tableName = (NSString *) value;
            break;
        case 1:
            setObject.srsId = (NSNumber *) value;
            break;
        case 2:
            setObject.minX = [GPKGUtils decimalNumberFromNumber:(NSNumber *) value];
            break;
        case 3:
            setObject.minY = [GPKGUtils decimalNumberFromNumber:(NSNumber *) value];
            break;
        case 4:
            setObject.maxX = [GPKGUtils decimalNumberFromNumber:(NSNumber *) value];
            break;
        case 5:
            setObject.maxY = [GPKGUtils decimalNumberFromNumber:(NSNumber *) value];
            break;
        default:
            [NSException raise:@"Illegal Column Index" format:@"Unsupported column index: %d", columnIndex];
            break;
    }
    
}

-(NSObject *) getValueFromObject: (NSObject*) object withColumnIndex: (int) columnIndex{
    
    NSObject * value = nil;
    
    GPKGTileMatrixSet *getObject = (GPKGTileMatrixSet*) object;
    
    switch(columnIndex){
        case 0:
            value = getObject.tableName;
            break;
        case 1:
            value = getObject.srsId;
            break;
        case 2:
            value = getObject.minX;
            break;
        case 3:
            value = getObject.minY;
            break;
        case 4:
            value = getObject.maxX;
            break;
        case 5:
            value = getObject.maxY;
            break;
        default:
            [NSException raise:@"Illegal Column Index" format:@"Unsupported column index: %d", columnIndex];
            break;
    }
    
    return value;
}

-(SFPProjection *) getProjection: (NSObject *) object{
    GPKGTileMatrixSet *projectionObject = (GPKGTileMatrixSet*) object;
    GPKGSpatialReferenceSystem * srs = [self getSrs:projectionObject];
    SFPProjection *projection = [srs projection];
    return projection;
}

-(NSArray *) getTileTables{
    
    NSString *queryString = [NSString stringWithFormat:@"select %@ from %@", GPKG_TMS_COLUMN_TABLE_NAME, GPKG_TMS_TABLE_NAME];
    
    GPKGResultSet *results = [self rawQuery:queryString];
    NSArray *tables = [self singleColumnResults:results];
    [results close];
    
    return tables;
}

-(GPKGSpatialReferenceSystem *) getSrs: (GPKGTileMatrixSet *) tileMatrixSet{
    GPKGSpatialReferenceSystemDao * dao = [self getSpatialReferenceSystemDao];
    GPKGSpatialReferenceSystem *srs = (GPKGSpatialReferenceSystem *)[dao queryForIdObject:tileMatrixSet.srsId];
    return srs;
}

-(GPKGContents *) getContents: (GPKGTileMatrixSet *) tileMatrixSet{
    GPKGContentsDao * dao = [self getContentsDao];
    GPKGContents *contents = (GPKGContents *)[dao queryForIdObject:tileMatrixSet.tableName];
    return contents;
}

-(GPKGBoundingBox *) boundingBoxOfTileMatrixSet: (GPKGTileMatrixSet *) tileMatrixSet inProjection: (SFPProjection *) projection{
    GPKGBoundingBox *boundingBox = [tileMatrixSet getBoundingBox];
    if (projection != nil) {
        SFPProjectionTransform *transform = [[SFPProjectionTransform alloc] initWithFromProjection:[self getProjection:tileMatrixSet] andToProjection:projection];
        if(![transform isSameProjection]){
            boundingBox = [boundingBox transform:transform];
        }
    }
    return boundingBox;
}

-(GPKGSpatialReferenceSystemDao *) getSpatialReferenceSystemDao{
    return [[GPKGSpatialReferenceSystemDao alloc] initWithDatabase:self.database];
}

-(GPKGContentsDao *) getContentsDao{
    return [[GPKGContentsDao alloc] initWithDatabase:self.database];
}

@end
