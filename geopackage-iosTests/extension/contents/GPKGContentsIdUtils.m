//
//  GPKGContentsIdUtils.m
//  geopackage-iosTests
//
//  Created by Brian Osborn on 2/6/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "GPKGContentsIdUtils.h"
#import "GPKGTestUtils.h"
#import "GPKGGeoPackageExtensions.h"
#import "GPKGContentsIdExtension.h"

@implementation GPKGContentsIdUtils

+(void) testContentsIdWithGeoPackage: (GPKGGeoPackage *) geoPackage{
    
    [GPKGGeoPackageExtensions deleteExtensionsWithGeoPackage:geoPackage];
    
    GPKGContentsIdExtension *contentsIdExtension = [[GPKGContentsIdExtension alloc] initWithGeoPackage:geoPackage];
    [GPKGTestUtils assertNotNil:contentsIdExtension.extensionsDao];
    [GPKGTestUtils assertFalse:[contentsIdExtension has]];
    [GPKGTestUtils assertNil:[contentsIdExtension getExtension]];
    
    [GPKGTestUtils assertEqualUnsignedLongWithValue:[geoPackage getTables].count andValue2:[contentsIdExtension missing].count];
    [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension ids] countAndClose]];
    
    for(int i = 0; i <= GPKG_CDT_GRIDDED_COVERAGE; i++){
        enum GPKGContentsDataType type = i;
        [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension idsForType:type] countAndClose]];
        [GPKGTestUtils assertEqualUnsignedLongWithValue:[geoPackage getTablesByType:type].count andValue2:[contentsIdExtension missingForType:type].count];
    }
    
    for(NSString *tableName in [geoPackage getTables]){
        GPKGContents *contents = [geoPackage contentsOfTable:tableName];
        [GPKGTestUtils assertNil:[contentsIdExtension getForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getForContents:contents]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForContents:contents]];
    }
    
    // Create all content ids
    [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTables].count andValue2:[contentsIdExtension createIds]];
    [GPKGTestUtils assertTrue:[contentsIdExtension has]];
    [GPKGTestUtils assertNotNil:[contentsIdExtension getExtension]];
    [GPKGTestUtils assertEqualIntWithValue:0 andValue2:(int)[contentsIdExtension missing].count];
    GPKGResultSet *contentsIds = [contentsIdExtension ids];
    [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTables].count andValue2:contentsIds.count];
    
    NSMutableSet *uniqueIds = [[NSMutableSet alloc] init];
    while([contentsIds moveToNext]){
        GPKGContentsId *contentsId = [contentsIdExtension contentsId:contentsIds];
        [GPKGTestUtils assertTrue:[contentsId.id intValue] >=0];
        [GPKGTestUtils assertFalse:[uniqueIds containsObject:contentsId.id]];
        [uniqueIds addObject:contentsId.id];
        [GPKGTestUtils assertNotNil:contentsId.contents];
        [GPKGTestUtils assertNotNil:contentsId.tableName];
        [GPKGTestUtils assertEqualWithValue:contentsId.tableName andValue2:contentsId.contents.tableName];
    }
    [contentsIds close];
    
    // Delete all content ids
    [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTables].count andValue2:[contentsIdExtension deleteIds]];
    [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension ids] countAndClose]];
    [GPKGTestUtils assertTrue:[contentsIdExtension has]];
    
    // Create contents ids for each contents data type
    int currentCount = 0;
    for(int i = 0; i <= GPKG_CDT_GRIDDED_COVERAGE; i++){
        enum GPKGContentsDataType type = i;
        int created = [contentsIdExtension createIdsForType:type];
        currentCount += created;
        [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTablesByType:type].count andValue2:created];
        [GPKGTestUtils assertEqualIntWithValue:created andValue2:[[contentsIdExtension idsForType:type] countAndClose]];
        [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTables].count - currentCount andValue2:(int)[contentsIdExtension missing].count];
        [GPKGTestUtils assertEqualIntWithValue:0 andValue2:(int)[contentsIdExtension missingForType:type].count];
        [GPKGTestUtils assertEqualIntWithValue:currentCount andValue2:[[contentsIdExtension ids] countAndClose]];
    }
    
    // Delete contents ids for each contents data type
    for(int i = 0; i <= GPKG_CDT_GRIDDED_COVERAGE; i++){
        enum GPKGContentsDataType type = i;
        int deleted = [contentsIdExtension deleteIdsForType:type];
        currentCount -= deleted;
        [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTablesByType:type].count andValue2:deleted];
        [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension idsForType:type] countAndClose]];
        [GPKGTestUtils assertEqualIntWithValue:(int)[geoPackage getTables].count - currentCount andValue2:(int)[contentsIdExtension missing].count];
        [GPKGTestUtils assertEqualUnsignedLongWithValue:[geoPackage getTablesByType:type].count andValue2:[contentsIdExtension missingForType:type].count];
        [GPKGTestUtils assertEqualIntWithValue:currentCount andValue2:[[contentsIdExtension ids] countAndClose]];
    }
    
    [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension ids] countAndClose]];
    [GPKGTestUtils assertTrue:[contentsIdExtension has]];
    
    // Delete the extension
    [contentsIdExtension removeExtension];
    [GPKGTestUtils assertFalse:[contentsIdExtension has]];
    [GPKGTestUtils assertNil:[contentsIdExtension getExtension]];
    
    // Create contents id's for each table one by one
    [uniqueIds removeAllObjects];
    for(NSString *tableName in [geoPackage getTables]){
        
        GPKGContents *contents = [geoPackage contentsOfTable:tableName];
        
        [GPKGTestUtils assertNil:[contentsIdExtension getForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getForContents:contents]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForContents:contents]];
        
        [GPKGTestUtils assertTrue:[[contentsIdExtension missing] containsObject:tableName]];
        [GPKGTestUtils assertFalse:[self resultSet:[contentsIdExtension ids] containsTable:tableName withExtension:contentsIdExtension]];
        [GPKGTestUtils assertTrue:[[contentsIdExtension missingForTypeName:contents.dataType] containsObject:tableName]];
        [GPKGTestUtils assertFalse:[self resultSet:[contentsIdExtension idsForTypeName:contents.dataType] containsTable:tableName withExtension:contentsIdExtension]];
        
        GPKGContentsId *contentsId = nil;
        NSNumber *contentsIdNumber = nil;
        
        int random = [GPKGTestUtils randomIntLessThan:8];
        switch (random) {
            case 0:
                contentsId = [contentsIdExtension createForContents:contents];
                break;
            case 1:
                contentsId = [contentsIdExtension createForTableName:tableName];
                break;
            case 2:
                contentsId = [contentsIdExtension getOrCreateForContents:contents];
                break;
            case 3:
                contentsId = [contentsIdExtension getOrCreateForTableName:tableName];
                break;
            case 4:
                contentsIdNumber = [contentsIdExtension createIdForContents:contents];
                break;
            case 5:
                contentsIdNumber = [contentsIdExtension createIdForTableName:tableName];
                break;
            case 6:
                contentsIdNumber = [contentsIdExtension getOrCreateIdForContents:contents];
                break;
            default:
                contentsIdNumber = [contentsIdExtension getOrCreateIdForTableName:tableName];
                break;
        }
        
        if (random < 4) {
            [GPKGTestUtils assertNotNil:contentsId];
            contentsIdNumber = contentsId.id;
            [GPKGTestUtils assertEqualWithValue:tableName andValue2:contentsId.tableName];
            [GPKGTestUtils assertNotNil:contentsId.contents];
            [GPKGTestUtils assertEqualWithValue:tableName andValue2:contentsId.contents.tableName];
        }
        
        [GPKGTestUtils assertNotNil:contentsIdNumber];
        [GPKGTestUtils assertTrue:[contentsIdNumber intValue] >= 0];
        [GPKGTestUtils assertFalse:[uniqueIds containsObject:contentsIdNumber]];
        [uniqueIds addObject:contentsIdNumber];
        
        [GPKGTestUtils assertFalse:[[contentsIdExtension missing] containsObject:tableName]];
        [GPKGTestUtils assertTrue:[self resultSet:[contentsIdExtension ids] containsTable:tableName withExtension:contentsIdExtension]];
        [GPKGTestUtils assertFalse:[[contentsIdExtension missingForTypeName:contents.dataType] containsObject:tableName]];
        [GPKGTestUtils assertTrue:[self resultSet:[contentsIdExtension idsForTypeName:contents.dataType] containsTable:tableName withExtension:contentsIdExtension]];
        
        [GPKGTestUtils assertEqualWithValue:contentsIdNumber andValue2:[contentsIdExtension getIdForTableName:tableName]];
        [GPKGTestUtils assertEqualWithValue:contentsIdNumber andValue2:[contentsIdExtension getIdForContents:contents]];
        [GPKGTestUtils assertEqualWithValue:contentsIdNumber andValue2:[contentsIdExtension getForTableName:tableName].id];
        [GPKGTestUtils assertEqualWithValue:contentsIdNumber andValue2:[contentsIdExtension getForContents:contents].id];
    }
    
    // Delete contents id's one by one
    [uniqueIds removeAllObjects];
    for(NSString *tableName in [geoPackage getTables]){
        
        GPKGContents *contents = [geoPackage contentsOfTable:tableName];
        
        [GPKGTestUtils assertTrue:[contentsIdExtension deleteForContents:contents]];
        
        [GPKGTestUtils assertNil:[contentsIdExtension getForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getForContents:contents]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForTableName:tableName]];
        [GPKGTestUtils assertNil:[contentsIdExtension getIdForContents:contents]];
        
        [GPKGTestUtils assertTrue:[[contentsIdExtension missing] containsObject:tableName]];
        [GPKGTestUtils assertFalse:[self resultSet:[contentsIdExtension ids] containsTable:tableName withExtension:contentsIdExtension]];
        [GPKGTestUtils assertTrue:[[contentsIdExtension missingForTypeName:contents.dataType] containsObject:tableName]];
        [GPKGTestUtils assertFalse:[self resultSet:[contentsIdExtension idsForTypeName:contents.dataType] containsTable:tableName withExtension:contentsIdExtension]];
    }
    
    [GPKGTestUtils assertEqualIntWithValue:0 andValue2:[[contentsIdExtension ids] countAndClose]];
    [GPKGTestUtils assertTrue:[contentsIdExtension has]];
    
    // Delete the extension
    [contentsIdExtension removeExtension];
    [GPKGTestUtils assertFalse:[contentsIdExtension has]];
    [GPKGTestUtils assertNil:[contentsIdExtension getExtension]];

}

+(BOOL) resultSet: (GPKGResultSet *) resultSet containsTable: (NSString *) tableName withExtension: (GPKGContentsIdExtension *) contentsIdExtension{
    
    BOOL contains = NO;
    
    while([resultSet moveToNext]){
        GPKGContentsId *contentsId = [contentsIdExtension contentsId:resultSet];
        contains = [contentsId.tableName isEqualToString:tableName];
        if(contains){
            break;
        }
    }
    
    [resultSet close];
    
    return contains;
}

@end
