//
//  geopackage-ios-Bridging-Header.h
//  geopackage-ios
//
//  Created by Brian Osborn on 11/23/15.
//  Copyright © 2015 NGA. All rights reserved.
//

#ifndef geopackage_ios_Bridging_Header_h
#define geopackage_ios_Bridging_Header_h

#import "sf-wkb-ios-Bridging-Header.h"
#import "sf-proj-ios-Bridging-Header.h"
#import "tiff-ios-Bridging-Header.h"
#import "GPKGBoundingBox.h"
#import "GPKGDateTimeUtils.h"
#import "GPKGGeoPackage.h"
#import "GPKGGeoPackageCache.h"
#import "GPKGGeoPackageConstants.h"
#import "GPKGUtils.h"
#import "geopackage_ios.h"
#import "GPKGAttributesColumn.h"
#import "GPKGAttributesDao.h"
#import "GPKGAttributesRow.h"
#import "GPKGAttributesTable.h"
#import "GPKGAttributesTableReader.h"
#import "GPKGContents.h"
#import "GPKGContentsDao.h"
#import "GPKGContentsDataTypes.h"
#import "GPKGSpatialReferenceSystem.h"
#import "GPKGSpatialReferenceSystemDao.h"
#import "GPKGConnection.h"
#import "GPKGDataTypes.h"
#import "GPKGFeatureIndexer.h"
#import "GPKGGeoPackageTableCreator.h"
#import "GPKGResultSet.h"
#import "GPKGSqlLiteQueryBuilder.h"
#import "GPKGSqlUtils.h"
#import "GPKGTableCreator.h"
#import "GPKGBaseDao.h"
#import "GPKGColumnValue.h"
#import "GPKGColumnValues.h"
#import "GPKGGeoPackageMetadata.h"
#import "GPKGGeoPackageMetadataDao.h"
#import "GPKGGeoPackageMetadataTableCreator.h"
#import "GPKGGeometryMetadata.h"
#import "GPKGGeometryMetadataDao.h"
#import "GPKGMetadataDb.h"
#import "GPKGTableMetadata.h"
#import "GPKGTableMetadataDao.h"
#import "GPKGConnectionPool.h"
#import "GPKGDbConnection.h"
#import "GPKGSqliteConnection.h"
#import "GPKGBaseExtension.h"
#import "GPKGCrsWktExtension.h"
#import "GPKGExtensions.h"
#import "GPKGExtensionsDao.h"
#import "GPKGGeoPackageExtensions.h"
#import "GPKGGeometryExtensions.h"
#import "GPKGMetadataExtension.h"
#import "GPKGNGAExtensions.h"
#import "GPKGSchemaExtension.h"
#import "GPKGWebPExtension.h"
#import "GPKGZoomOtherExtension.h"
#import "GPKGCoverageDataImage.h"
#import "GPKGCoverageDataPngImage.h"
#import "GPKGCoverageDataRequest.h"
#import "GPKGCoverageDataSourcePixel.h"
#import "GPKGCoverageDataTiffImage.h"
#import "GPKGCoverageDataTileMatrixResults.h"
#import "GPKGCoverageDataResults.h"
#import "GPKGCoverageDataAlgorithms.h"
#import "GPKGCoverageData.h"
#import "GPKGCoverageDataPng.h"
#import "GPKGCoverageDataTiff.h"
#import "GPKGGriddedCoverage.h"
#import "GPKGGriddedCoverageDao.h"
#import "GPKGGriddedCoverageDataTypes.h"
#import "GPKGGriddedTile.h"
#import "GPKGGriddedTileDao.h"
#import "GPKGFeatureTableIndex.h"
#import "GPKGGeometryIndex.h"
#import "GPKGGeometryIndexDao.h"
#import "GPKGTableIndex.h"
#import "GPKGTableIndexDao.h"
#import "GPKGFeatureTileLink.h"
#import "GPKGFeatureTileLinkDao.h"
#import "GPKGFeatureTileTableLinker.h"
#import "GPKGGeoPackageFactory.h"
#import "GPKGGeoPackageManager.h"
#import "GPKGGeometryColumns.h"
#import "GPKGGeometryColumnsDao.h"
#import "GPKGFeatureIndexGeoPackageResults.h"
#import "GPKGFeatureIndexManager.h"
#import "GPKGFeatureIndexMetadataResults.h"
#import "GPKGFeatureIndexResults.h"
#import "GPKGFeatureIndexTypes.h"
#import "GPKGFeatureColumn.h"
#import "GPKGFeatureDao.h"
#import "GPKGFeatureRow.h"
#import "GPKGFeatureTable.h"
#import "GPKGFeatureTableReader.h"
#import "GPKGGeometryData.h"
#import "GPKGMapPoint.h"
#import "GPKGMapPointInitializer.h"
#import "GPKGMapPointOptions.h"
#import "GPKGMapShape.h"
#import "GPKGMapShapeConverter.h"
#import "GPKGMapShapePoints.h"
#import "GPKGMapShapeTypes.h"
#import "GPKGMultiPoint.h"
#import "GPKGMultiPolygon.h"
#import "GPKGMultiPolygonPoints.h"
#import "GPKGMultiPolyline.h"
#import "GPKGMultiPolylinePoints.h"
#import "GPKGPolygonHolePoints.h"
#import "GPKGPolygonPoints.h"
#import "GPKGPolylinePoints.h"
#import "GPKGShapePoints.h"
#import "GPKGShapeWithChildrenPoints.h"
#import "GPKGCompressFormats.h"
#import "GPKGIOUtils.h"
#import "GPKGImageConverter.h"
#import "GPKGProgress.h"
#import "GPKGMetadata.h"
#import "GPKGMetadataDao.h"
#import "GPKGMetadataScope.h"
#import "GPKGMetadataReference.h"
#import "GPKGMetadataReferenceDao.h"
#import "GPKGProperties.h"
#import "GPKGPropertyConstants.h"
#import "GPKGDataColumns.h"
#import "GPKGDataColumnsDao.h"
#import "GPKGDataColumnConstraints.h"
#import "GPKGDataColumnConstraintsDao.h"
#import "GPKGTileBoundingBoxUtils.h"
#import "GPKGTileGenerator.h"
#import "GPKGTileGrid.h"
#import "GPKGUrlTileGenerator.h"
#import "GPKGCustomFeaturesTile.h"
#import "GPKGFeatureTileGenerator.h"
#import "GPKGFeatureTilePointIcon.h"
#import "GPKGFeatureTiles.h"
#import "GPKGNumberFeaturesTile.h"
#import "GPKGTileMatrix.h"
#import "GPKGTileMatrixDao.h"
#import "GPKGTileMatrixSet.h"
#import "GPKGTileMatrixSetDao.h"
#import "GPKGBoundedOverlay.h"
#import "GPKGFeatureOverlay.h"
#import "GPKGFeatureOverlayQuery.h"
#import "GPKGFeatureRowData.h"
#import "GPKGFeatureTableData.h"
#import "GPKGGeoPackageOverlay.h"
#import "GPKGOverlayFactory.h"
#import "GPKGStandardFormatOverlay.h"
#import "GPKGGeoPackageTile.h"
#import "GPKGGeoPackageTileRetriever.h"
#import "GPKGStandardFormatTileRetriever.h"
#import "GPKGTileCreator.h"
#import "GPKGTileRetriever.h"
#import "GPKGTileColumn.h"
#import "GPKGTileDao.h"
#import "GPKGTileDaoUtils.h"
#import "GPKGTileRow.h"
#import "GPKGTileTable.h"
#import "GPKGTileTableReader.h"
#import "GPKGContentValues.h"
#import "GPKGUserColumn.h"
#import "GPKGUserDao.h"
#import "GPKGUserRow.h"
#import "GPKGUserTable.h"
#import "GPKGUserTableReader.h"
#import "GPKGUserUniqueConstraint.h"
#import "GPKGGeoPackageValidate.h"
#import "GPKGPolygonOrientations.h"
#import "GPKGGeometryUtils.h"
#import "GPKGSessionTaskData.h"
#import "GPKGFeatureShapes.h"
#import "GPKGMapUtils.h"
#import "GPKGUserRowSync.h"
#import "GPKGFeatureIndexResultSetResults.h"
#import "GPKGFeatureIndexListResults.h"
#import "GPKGMultipleFeatureIndexResults.h"
#import "GPKGLocationBoundingBox.h"
#import "GPKGFeatureInfoBuilder.h"
#import "GPKGMapTolerance.h"
#import "GPKGRTreeIndexExtension.h"
#import "GPKGGriddedCoverageEncodingTypes.h"
#import "GPKGConnectionFunction.h"
#import "GPKGTileScaling.h"
#import "GPKGTileScalingDao.h"
#import "GPKGTileScalingTypes.h"
#import "GPKGTileTableScaling.h"
#import "GPKGCompositeOverlay.h"
#import "GPKGGeometryJSONCompatible.h"
#import "GPKGExtendedRelation.h"
#import "GPKGExtendedRelationsDao.h"
#import "GPKGRelatedTablesExtension.h"
#import "GPKGRelationTypes.h"
#import "GPKGUserMappingTable.h"
#import "GPKGUserRelatedTable.h"
#import "GPKGDublinCoreMetadata.h"
#import "GPKGDublinCoreTypes.h"
#import "GPKGMediaTable.h"
#import "GPKGSimpleAttributesTable.h"
#import "GPKGUserCustomColumn.h"
#import "GPKGUserCustomTable.h"
#import "GPKGUserCustomDao.h"
#import "GPKGUserCustomRow.h"
#import "GPKGUserCustomTableReader.h"
#import "GPKGUserMappingDao.h"
#import "GPKGUserMappingRow.h"
#import "GPKGMediaDao.h"
#import "GPKGMediaRow.h"
#import "GPKGSimpleAttributesDao.h"
#import "GPKGSimpleAttributesRow.h"
#import "GPKGPropertyNames.h"
#import "GPKGPropertiesExtension.h"
#import "GPKGPropertiesManager.h"
#import "GPKGManualFeatureQueryResults.h"
#import "GPKGManualFeatureQuery.h"
#import "GPKGRTreeIndexTableDao.h"
#import "GPKGRTreeIndexTableRow.h"
#import "GPKGFeatureIndexRTreeResults.h"
#import "GPKGFeatureIndexFeatureResults.h"

#endif /* geopackage_ios_Bridging_Header_h */
